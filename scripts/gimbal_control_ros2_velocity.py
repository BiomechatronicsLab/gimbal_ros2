#!/usr/bin/env python3
import sys

from typing import Callable, Any, Type

from functools import partial

from dynio import dynamixel_controller as dxl
import time
import csv
import numpy as np
import math

import rclpy
from rclpy.node import Node
import rclpy.logging

from gimbal_ros2.msg import Gimbal
from serial.serialutil import SerialException


# note: modify gimbal_topic to receive pan and tilt from headset, otherwise receive sample motor waypoints by uncommenting gimbal_pub node in launch files


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


class GimbalSubscriber(Node):
    """
    A ROS2 subscriber that listens to desired Dynamxiel positions and
    update commands to physical motors using velocity control.
    """

    def __init__(self):
        super().__init__("gimbal_subscriber")

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

        self.gimbal_pan = dxl_io.new_mx64(dxl_id=0, protocol=2)
        self.gimbal_tilt = dxl_io.new_mx64(dxl_id=1, protocol=2)
        self.is_first_time_step = True

        # Torque must be disabled to change modes
        self.gimbal_pan.torque_disable()
        # Start velocity control mode for pan dynamixel
        self.gimbal_pan.set_velocity_mode()
        self.gimbal_pan.torque_enable()

        # Torque must be disabled to change modes
        self.gimbal_tilt.torque_disable()
        # Start velocity control mode for tilt dynamixel
        self.gimbal_tilt.set_velocity_mode()
        self.gimbal_tilt.torque_enable()

        self.pos_pan_zero = self.gimbal_pan.get_position()
        self.pos_tilt_zero = self.gimbal_tilt.get_position()

        self.msg_pan_zero = None
        self.msg_tilt_zero = None
        self.pos_pan_prev = None
        self.pos_tilt_prev = None

        self.subscription = self.create_subscription(
            Gimbal, "/gimbal_topic", self.listener_callback, 10
        )

    def listener_callback(self, msg):
        if self.is_first_time_step:
            self.msg_pan_zero = msg.pan / (2 * np.pi) * 4096
            self.msg_tilt_zero = msg.tilt / (2 * np.pi) * 4096

            self.gimbal_pan.set_velocity(0)
            self.gimbal_tilt.set_velocity(0)

            self.pos_pan = self.pos_pan_zero
            self.pos_tilt = self.pos_tilt_zero
            self.pos_pan_prev = self.pos_pan_zero
            self.pos_tilt_prev = self.pos_tilt_zero

            self.is_first_time_step = False
        else:
            self.pos_pan = (
                msg.pan / (2 * np.pi) * 4096
            )  # + self.pos_pan_0  - self.msg_pan_0 / (2*np.pi)*4096    # uncomment if want to track relative movements of the headset, otherwise will track the absolute values of headset angles
            self.pos_tilt = (
                msg.tilt / (2 * np.pi) * 4096
            )  # + self.pos_tilt_0 - self.msg_tilt_0 / (2*np.pi)*4096   # uncomment if want to track relative movements of the headset, otherwise will track the absolute values of headset angles

            self.velocity_pan = self.pos_pan - self.pos_pan_prev
            self.velocity_tilt = self.pos_tilt - self.pos_tilt_prev

            self.gimbal_pan.set_velocity(int(self.velocity_pan))
            self.gimbal_tilt.set_velocity(int(self.velocity_tilt))

            self.pos_pan_prev = self.pos_pan
            self.pos_tilt_prev = self.pos_tilt

    def cleanup(self):
        # TODO: Go to gimbal "home" position

        # Turn off the motors
        self.gimbal_pan.set_velocity(0)
        self.gimbal_pan.torque_disable()

        self.gimbal_tilt.set_velocity(0)
        self.gimbal_tilt.torque_disable()


def main(args=None):
    rclpy.init(args=args)
    gimbal_subscriber = None

    try:
        gimbal_subscriber = GimbalSubscriber()
        rclpy.spin(gimbal_subscriber)
    except KeyboardInterrupt:
        if gimbal_subscriber is not None:
            gimbal_subscriber.destroy_node()

        if rclpy.ok():
            rclpy.shutdown()


if __name__ == "__main__":
    main()
