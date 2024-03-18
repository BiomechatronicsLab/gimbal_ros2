#!/usr/bin/env python3
from typing import Callable, Any, Type

from functools import partial

from dynio import dynamixel_controller as dxl
import time
import numpy as np
import math

import rclpy
from rclpy.node import Node
import rclpy.logging

from configuration.configuration import Configuration
from gimbal_ros2.msg import Gimbal
from std_msgs.msg import Bool
from serial.serialutil import SerialException


def map_range(
    input_val: float,
    input_range_min: float,
    input_range_max: float,
    output_range_min: float,
    output_range_max: float,
):
    return (input_val - input_range_min) / (input_range_max - input_range_min) * (
        output_range_max - output_range_min
    ) + output_range_min


def exponential_back_off(
    fn: Callable[[], Any],
    exceptions: tuple[Type[Exception], ...] = (),
    min_duration_s: float = 0.1,
    max_duration_s: float = 5.0,
):
    max_duration_s = 5
    map_back_off_param = partial(
        map_range,
        input_range_min=0.0,
        input_range_max=1.0,
        output_range_min=np.log(max(1 - min_duration_s / 5, 0.001)),
        output_range_max=-10.0,
    )

    def calc_duration_s(back_off: float):
        return max_duration_s * (1 - np.exp(map_back_off_param(back_off)))

    back_off_param = 0.0
    result = None
    attempt_counter = 1
    while True:
        if math.isclose(back_off_param, 1.0, abs_tol=1e-6):
            duration = max_duration_s
        else:
            duration = calc_duration_s(back_off_param)

        time.sleep(duration)
        try:
            print(f"Retrying dynamixel connection (Attempt {attempt_counter})")
            result = fn()
        except KeyboardInterrupt:
            print("Exiting ...")
            exit(1)
        except exceptions:
            pass

        if result is not None:
            return result

        # This leads to (1.0 - 0.0) / 0.04 = 25 attempts before reaching max duration
        back_off_param += 0.04
        attempt_counter += 1


DYN_ENCODER_TICKS_PER_RAD = 4096 / 2 / math.pi
DYN_MIN_POSITION_TICKS = 0
DYN_MAX_POSITION_TICKS = 4095
DYN_MIN_P_GAIN = 0
DYN_MAX_P_GAIN = 16_383


class GimbalSubscriber(Node):
    """
    A ROS2 subscriber that listens to desired Dynamxiel positions and
    update commands to physical motors using velocity control.
    """

    def __init__(self):
        super().__init__("gimbal_subscriber")

        config = Configuration()["gimbal"]
        print(config)

        self.pan_prop_gain = config["pan_prop_gain"]
        self.tilt_prop_gain = config["tilt_prop_gain"]

        self.pan_joint_min_limit_ticks = round(
            DYN_ENCODER_TICKS_PER_RAD * math.radians(config["pan_joint_min_limit_deg"])
        )
        self.pan_joint_max_limit_ticks = round(
            DYN_ENCODER_TICKS_PER_RAD * math.radians(config["pan_joint_max_limit_deg"])
        )

        self.tilt_joint_min_limit_ticks = round(
            DYN_ENCODER_TICKS_PER_RAD * math.radians(config["tilt_joint_min_limit_deg"])
        )
        self.tilt_joint_max_limit_ticks = round(
            DYN_ENCODER_TICKS_PER_RAD * math.radians(config["tilt_joint_max_limit_deg"])
        )

        self.pan_joint_home_pos_deg = config["pan_joint_home_pos_deg"]
        self.tilt_joint_home_pos_deg = config["tilt_joint_home_pos_deg"]

        max_pan_ang_vel_rpm = config["max_pan_ang_vel_rpm"]
        max_tilt_ang_vel_rpm = config["max_tilt_ang_vel_rpm"]

        self.max_pan_ang_vel_rad_per_s = max_pan_ang_vel_rpm * math.tau / 60
        self.max_tilt_ang_vel_rad_per_s = max_tilt_ang_vel_rpm * math.tau / 60

        # Initialize Dynamixel USB serial port connection
        self.port_name = self.declare_parameter(
            "usb_port", rclpy.Parameter.Type.STRING
        ).value

        def try_dynamixel_connect() -> dxl.DynamixelIO:
            return dxl.DynamixelIO(device_name=self.port_name, baud_rate=57600)

        try:
            dxl_io = try_dynamixel_connect()
        except SerialException:
            # Try repeatedly with each attempt separated by an exponentially growing
            # duration with maximum duration of 5 seconds
            print("Failed to connect to dynamixel ...")
            print("Retrying ...")
            dxl_io = exponential_back_off(
                try_dynamixel_connect, exceptions=(SerialException,)
            )

        self.gimbal_pan_motor = dxl_io.new_mx64(dxl_id=0, protocol=2)
        self.gimbal_tilt_motor = dxl_io.new_mx64(dxl_id=1, protocol=2)
        self.gimbal_pan_motor.torque_disable()
        self.gimbal_tilt_motor.torque_disable()

        # Set pan motor joint limits (must be in range [0, 4095])
        self.gimbal_pan_motor.write_control_table(
            "Min_Position_Limit",
            max(
                DYN_MIN_P_GAIN,
                min(self.pan_joint_min_limit_ticks, DYN_MAX_POSITION_TICKS),
            ),
        )
        self.gimbal_pan_motor.write_control_table(
            "Max_Position_Limit",
            max(
                DYN_MIN_P_GAIN,
                min(self.pan_joint_max_limit_ticks, DYN_MAX_POSITION_TICKS),
            ),
        )

        # Set tilt motor joint limits  (must be in range [0, 4095])
        self.gimbal_tilt_motor.write_control_table(
            "Min_Position_Limit",
            max(
                DYN_MIN_P_GAIN,
                min(self.tilt_joint_min_limit_ticks, DYN_MAX_POSITION_TICKS),
            ),
        )
        self.gimbal_tilt_motor.write_control_table(
            "Max_Position_Limit",
            max(
                DYN_MIN_P_GAIN,
                min(self.tilt_joint_max_limit_ticks, DYN_MAX_POSITION_TICKS),
            ),
        )

        # Set pan/tilt motor control velocity P gain (must be in range [0, 16_383])
        self.gimbal_pan_motor.write_control_table(
            "Velocity_P_Gain",
            round(max(DYN_MIN_P_GAIN, min(self.pan_prop_gain, DYN_MAX_P_GAIN))),
        )
        self.gimbal_tilt_motor.write_control_table(
            "Velocity_P_Gain",
            round(max(DYN_MIN_P_GAIN, min(self.tilt_prop_gain, DYN_MAX_P_GAIN))),
        )

        self.is_first_time_step = True
        self.is_active = False

        self.user_pan_ang_curr_rad = None
        self.user_tilt_ang_curr_rad = None
        self.user_pan_ang_zero_rad = None
        self.user_tilt_ang_zero_rad = None
        self.motor_pan_ang_zero_rad = None
        self.motor_tilt_ang_zero_rad = None

        self.activate()

        self.subscription = self.create_subscription(
            Gimbal, "/gimbal_topic", self.listener_callback, 1
        )

        self.subscription = self.create_subscription(
            Bool, "/gimbal/should_be_active", self.activation_state_cb, 1
        )

        motor_control_freq_Hz = max(1, config["motor_control_freq_Hz"])
        self.timer_period_s = 1 / motor_control_freq_Hz
        self.timer = self.create_timer(
            timer_period_sec=self.timer_period_s, callback=self.motor_control_cb
        )

    def motor_control_cb(self):
        if not self.is_active:
            # Controller should not be active
            return

        if self.user_pan_ang_zero_rad is None or self.user_tilt_ang_zero_rad is None:
            # First command not received yet
            return

        goal_pan_motor_position_rad = self.motor_pan_ang_zero_rad + (
            self.user_pan_ang_curr_rad - self.user_pan_ang_zero_rad
        )
        curr_pan_motor_position_rad = math.radians(self.gimbal_pan_motor.get_angle())
        user_pan_ang_vel_ticks_per_s = DYN_ENCODER_TICKS_PER_RAD * min(
            (goal_pan_motor_position_rad - curr_pan_motor_position_rad)
            / self.timer_period_s,
            self.max_pan_ang_vel_rad_per_s,
        )

        goal_tilt_motor_position_rad = self.motor_tilt_ang_zero_rad + (
            self.user_tilt_ang_curr_rad - self.user_tilt_ang_zero_rad
        )
        curr_tilt_motor_position_rad = math.radians(self.gimbal_tilt_motor.get_angle())
        user_tilt_ang_vel_ticks_per_s = DYN_ENCODER_TICKS_PER_RAD * min(
            (goal_tilt_motor_position_rad - curr_tilt_motor_position_rad)
            / self.timer_period_s,
            self.max_tilt_ang_vel_rad_per_s,
        )

        # TODO: Consider integral and/or derivative gains
        self.gimbal_pan_motor.set_velocity(round(user_pan_ang_vel_ticks_per_s))

        # TODO: Consider integral and/or derivative gains
        self.gimbal_tilt_motor.set_velocity(round(user_tilt_ang_vel_ticks_per_s))

    def listener_callback(self, msg: Gimbal):
        self.user_pan_ang_curr_rad = float(msg.pan)
        self.user_tilt_ang_curr_rad = float(msg.tilt)

        if self.is_first_time_step:
            self.user_pan_ang_zero_rad = float(self.user_pan_ang_curr_rad)
            self.user_tilt_ang_zero_rad = float(self.user_tilt_ang_curr_rad)

            self.is_first_time_step = False

    def activation_state_cb(self, msg: Bool):
        if self.is_active and not msg.data:
            self.deactivate()
        elif not self.is_active and msg.data:
            self.activate()

    def go_to_home(self):
        if self.is_active:
            self.gimbal_pan_motor.torque_disable()
            self.gimbal_pan_motor.set_position_mode()
            self.gimbal_pan_motor.torque_enable()
            self.gimbal_pan_motor.set_angle(self.pan_joint_home_pos_deg)

            self.gimbal_tilt_motor.torque_disable()
            self.gimbal_tilt_motor.set_position_mode()
            self.gimbal_tilt_motor.torque_enable()
            self.gimbal_tilt_motor.set_angle(self.tilt_joint_home_pos_deg)

    def deactivate(self):
        if self.is_active:
            self.go_to_home()

            # Turn off the motors
            self.gimbal_pan_motor.torque_disable()
            self.gimbal_tilt_motor.torque_disable()

            self.is_active = False

    def activate(self):
        if not self.is_active:
            # Set motor zero to home position
            self.motor_pan_ang_zero_rad = math.radians(
                self.gimbal_pan_motor.get_angle()
            )
            self.motor_tilt_ang_zero_rad = math.radians(
                self.gimbal_tilt_motor.get_angle()
            )

            self.go_to_home()

            # Torque must be disabled to change modes
            self.gimbal_pan_motor.torque_disable()
            # Start velocity control mode for pan dynamixel
            self.gimbal_pan_motor.set_velocity_mode()
            self.gimbal_pan_motor.torque_enable()

            # Torque must be disabled to change modes
            self.gimbal_tilt_motor.torque_disable()
            # Start velocity control mode for tilt dynamixel
            self.gimbal_tilt_motor.set_velocity_mode()
            self.gimbal_tilt_motor.torque_enable()

            self.is_active = True


def main(args=None):
    rclpy.init(args=args)

    gimbal_subscriber = None

    try:
        gimbal_subscriber = GimbalSubscriber()
        rclpy.spin(gimbal_subscriber)
    except KeyboardInterrupt:
        if gimbal_subscriber is not None:
            gimbal_subscriber.deactivate()
            gimbal_subscriber.destroy_node()

        if rclpy.ok():
            rclpy.shutdown()


if __name__ == "__main__":
    main()
