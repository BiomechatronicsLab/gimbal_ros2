#!/usr/bin/env python3

"""
Developed By: Lionel

Updated to ROS2 by: S. M. Asjad

"""

from dynio import dynamixel_controller as dxl
import sys

import rclpy
from rclpy.node import Node
import rclpy.logging

from sensor_msgs.msg import JointState
import numpy as np
import time

import threading

#####

ADDR_TORQUE_ENABLE = 64
ADDR_GOAL_POSITION = 116
ADDR_GOAL_VELOCITY = 104
ADDR_VELOCITY_LIMIT = 44
ADDR_VELOCITY_PROFILE = 112
ADDR_PRESENT_POSITION = 132
ADDR_PRESENT_VELOCITY = 128

DXL_MINIMUM_POSITION_VALUE = 0  # Refer to the Minimum Position Limit of product eManual
DXL_MAXIMUM_POSITION_VALUE = (
    1024  # Refer to the Maximum Position Limit of product eManual
)
BAUDRATE = 57600
ADDR_CONTROL_MODE = 11
POSITION_MODE = 3
VELOCITY_MODE = 1

PROTOCOL_VERSION = 2.0
DEVICENAME = "/dev/u2d2"
TORQUE_ENABLE = 1  # Value for enabling the torque
TORQUE_DISABLE = 0  # Value for disabling the torque

DXL_ID_LINK_2 = 1
DXL_ID_LINK_1 = 0



# Set maximum Velocity
HIGH_VEL = 1023
LOW_VEL = int(1023/1)

class GimbalDriver(Node):
    def __init__(self):
        super().__init__("gimbal_driver")


        self.portHandler = dxl.PortHandler(DEVICENAME)

        
        # Open port
        if self.portHandler.openPort():
            self.get_logger().info("Succeeded to open port for Gimbal Driver")
        else:
            self.get_logger().error("Failed to open the port for Gimbal Driver")
            sys.exit()

        
        # Set port baudrate
        if self.portHandler.setBaudRate(BAUDRATE):
            self.get_logger().info("Succeeded to change the baudrate for Gimbal Driver")
        else:
            self.get_logger().error("Failed to change the baudrate for Gimbal Driver")
            sys.exit()
        
        self.packetHandler = dxl.PacketHandler(PROTOCOL_VERSION)

        # Disable Dynamixel Torque
        self.packetHandler.write1ByteTxRx(
            self.portHandler, DXL_ID_LINK_1, ADDR_TORQUE_ENABLE, TORQUE_DISABLE
        )
        self.packetHandler.write1ByteTxRx(
            self.portHandler, DXL_ID_LINK_2, ADDR_TORQUE_ENABLE, TORQUE_DISABLE
        )
        
        # Place Dynamixel in position control mode
        self.packetHandler.write1ByteTxRx(
            self.portHandler, DXL_ID_LINK_1, ADDR_CONTROL_MODE, POSITION_MODE
        )
        self.packetHandler.write1ByteTxRx(
            self.portHandler, DXL_ID_LINK_2, ADDR_CONTROL_MODE, POSITION_MODE
        )

        self.packetHandler.write4ByteTxRx(self.portHandler, DXL_ID_LINK_1, ADDR_VELOCITY_LIMIT, HIGH_VEL)
        self.packetHandler.write4ByteTxRx(self.portHandler, DXL_ID_LINK_2, ADDR_VELOCITY_LIMIT, HIGH_VEL)

        self.packetHandler.write4ByteTxRx(self.portHandler, DXL_ID_LINK_1, ADDR_VELOCITY_PROFILE, LOW_VEL)
        self.packetHandler.write4ByteTxRx(self.portHandler, DXL_ID_LINK_2, ADDR_VELOCITY_PROFILE, LOW_VEL)
        
        # Enable Dynamixel Torque
        self.packetHandler.write1ByteTxRx(
            self.portHandler, DXL_ID_LINK_1, ADDR_TORQUE_ENABLE, TORQUE_ENABLE
        )
        self.packetHandler.write1ByteTxRx(
            self.portHandler, DXL_ID_LINK_2, ADDR_TORQUE_ENABLE, TORQUE_ENABLE
        )

        self.yaw = 0
        self.pitch = 0
        self.POSITION = [0]*2

        self.subscription = self.create_subscription(
            JointState, "gimbal", self.listener, 10
        )
        self.subscription
        self.packet_num = 0


    def listener(self, msg):
        
        self.packet_num += 1
        self.time = time.time()
        self.yaw = msg.position[msg.name.index("yaw")]
        self.pitch = msg.position[msg.name.index("pitch")]
        yaw = self.yaw % (2 * np.pi)
        pitch = self.pitch % (2 * np.pi)
        if yaw > np.pi:
            yaw -= 2 * np.pi
        if pitch > np.pi:
            pitch -= 2 * np.pi
        self.update_servo(DXL_ID_LINK_1,yaw)
        self.update_servo(DXL_ID_LINK_2,pitch)
        self.get_logger().info("Packet Number: %d, Time: %f, Yaw: %f, Pitch: %f \n" % (self.packet_num, self.time, yaw, pitch))



        
    def update_servo(self, motorID ,angle_in_radian):

        POSITION = int(-1 * angle_in_radian / (2 * np.pi) * 4096) + 2048
        if(abs(POSITION-self.POSITION[motorID])>15):
            dxl_comm_result, dxl_error = self.packetHandler.write4ByteTxRx(
                self.portHandler, motorID, ADDR_GOAL_POSITION, POSITION
            )

            self.POSITION[motorID] = POSITION
            self.get_logger().info("Motor ID: %d, Position: %d" % (motorID, POSITION))
    
    def __del__(self):

        # Disable Dynamixel Torque
        self.packetHandler.write1ByteTxRx(
            self.portHandler, DXL_ID_LINK_1, ADDR_TORQUE_ENABLE, TORQUE_DISABLE
        )
        self.packetHandler.write1ByteTxRx(
            self.portHandler, DXL_ID_LINK_2, ADDR_TORQUE_ENABLE, TORQUE_DISABLE
        )

        # Close port
        self.portHandler.closePort()
        print("Gimbal Driver Port Closed")


def main():
    rclpy.init()
    gimbal_driver = GimbalDriver()
    rclpy.spin(gimbal_driver)
    rclpy.shutdown()
    gimbal_driver.portHandler.closePort()
    print("Gimbal Driver Port Closed")

if __name__ == "__main__":
    main()


