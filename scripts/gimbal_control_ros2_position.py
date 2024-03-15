#!/usr/bin/env python3

from dynio import *  # https://pypi.org/project/dynamixel-controller/
import time

# import rospy
import csv
import numpy as np

import rclpy
from rclpy.node import Node


# from std_msgs.msg import String
from gimbal_ros2.msg import Gimbal

# note: NEED to run gimbal_pub at another terminal to receive desired motor positions


class MinimalSubscriber(Node):
    def __init__(self):
        super().__init__("minimal_subscriber")
        self.subscription = self.create_subscription(
            Gimbal, "topic", self.listener_callback, 10
        )
        self.subscription
        self.ts = 0

    def listener_callback(self, msg):
        self.get_logger().info(
            "Subscription: gimbal_pan = %f, gimbal_tilt = %f" % (msg.pan, msg.tilt)
        )

        global msg_pan_0, msg_tilt_0
        if self.ts == 0:
            msg_pan_0 = msg.pan
            msg_tilt_0 = msg.tilt

        position_pan = gimbal_pan_0 + msg.pan - msg_pan_0
        position_tilt = gimbal_tilt_0 + msg.tilt - msg_tilt_0

        gimbal_pan.set_position(int(position_pan))
        gimbal_tilt.set_position(int(position_tilt))

        print(
            "output_pan = %f, output_tilt = %f"
            % (gimbal_pan.get_position(), gimbal_tilt.get_position())
        )
        self.ts += 1


def main(args=None):
    rclpy.init(args=args)

    global gimbal_pan, gimbal_tilt, gimbal_pan_0, gimbal_tilt_0

    # initialize dynamixel
    dxl_io = dxl.DynamixelIO(
        device_name="/dev/tty.usbserial-FT6Z5UZP", baud_rate=57600
    )  # your port for U2D2 or other serial device

    gimbal_pan = dxl_io.new_mx64(dxl_id=0, protocol=2)
    gimbal_tilt = dxl_io.new_mx64(dxl_id=1, protocol=2)

    gimbal_pan.torque_disable()  # you have to disable torque before you change modes
    gimbal_pan.set_position_mode()
    gimbal_pan.torque_enable()
    gimbal_tilt.torque_disable()  # you have to disable torque before you change modes
    gimbal_tilt.set_position_mode()
    gimbal_tilt.torque_enable()

    gimbal_pan_0 = gimbal_pan.get_position()
    gimbal_tilt_0 = gimbal_tilt.get_position()

    # run ros2 callback with subscriber to desired dynamxiel positions and update commands to physical motors
    minimal_subscriber = MinimalSubscriber()
    rclpy.spin(minimal_subscriber)

    # Destroy the node explicitly  (optional - otherwise it will be done automatically when the garbage collector destroys the node object)
    minimal_subscriber.destroy_node()
    rclpy.shutdown()

    # turn off the
    gimbal_pan.set_velocity(0)
    gimbal_pan.torque_disable()

    gimbal_tilt.set_velocity(0)
    gimbal_tilt.torque_disable()


if __name__ == "__main__":
    main()
