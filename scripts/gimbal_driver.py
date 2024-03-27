#!/usr/bin/env python3

from dynamixel_sdk import *  # Uses Dynamixel SDK library
from dynamixel_sdk.port_handler import PortHandler
from dynamixel_sdk.packet_handler import PacketHandler
from dynamixel_sdk.robotis_def import *
from dynamic_reconfigure.server import Server
from hfi_robotics_ue.cfg import GimbalConfig
import threading
import numpy as np

import rospy
from std_msgs.msg import Float64MultiArray

# import own lib of helper functions (need to add its dir to path, and need to use 'relative' dir)
import os, sys
this_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, this_dir)
import helper

# Program mode
MODES = ["Joint", "IK"]
MODE = MODES[1]

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
index = 0

class GimbalDriver:
    def __init__(self):
        self.rate = rospy.Rate(30)
        # Subscribers
        self.gimbal_cmd_sub = rospy.Subscriber("/demo/gimbal_cmd", Float64MultiArray, self.gimbal_cmd_cb, queue_size=1)
        self.srv = Server(GimbalConfig,self.param_callback)
        
        self.pan = 0
        self.tilt = 0 

        # Initialize PortHandler instance
        # Set the port path
        # Get methods and members of PortHandlerLinux or PortHandlerWindows
        self.portHandler = PortHandler(DEVICENAME)
        # Initialize PacketHandler instance
        # Set the protocol version
        # Get methods and members of Protocol1PacketHandler or Protocol2PacketHandler
        self.packetHandler = PacketHandler(PROTOCOL_VERSION)
        
        # Open port
        if self.portHandler.openPort():
            print("Succeeded to open the port")
        else:
            print("Failed to open the port")
        
        # Set port baudrate
        if self.portHandler.setBaudRate(BAUDRATE):
            print("Succeeded to change the baudrate")
        else:
            print("Failed to change the baudrate")
            print("Press any key to terminate...")
        
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
        
        # Set maximum Velocity
        HIGH_VEL = 1024
        LOW_VEL = 50

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

        self.thread = threading.Thread(target=self.loop())
    
    def param_callback(self, config, level):
        self.params = config

        self.pan_scale = config['yaw_scale']
        self.tilt_scale = config['pitch_scale']
        self.pan_offset = np.deg2rad(config['yaw_offset'])
        self.tilt_offset = np.deg2rad(config['pitch_offset'])

        return config 

    def wrap(self,angle):
        while np.abs(angle) > np.pi:
            if angle > np.pi:
                angle = angle - np.pi
    
            if angle < -np.pi:
                angle = angle + np.pi
        return angle
    
    def update_servo(self, ID, radians):
        # Write the angle in radians to the servo
        POSITION = int(-1 * radians / (2 * np.pi) * 4096) + 2048
        
        # Write goal angle to servo
        dxl_comm_result, dxl_error = self.packetHandler.write4ByteTxRx(
            self.portHandler, ID, ADDR_GOAL_POSITION, POSITION
        )
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % self.packetHandler.getRxPacketError(dxl_error))
    
    def gimbal_cmd_cb(self, data):
        # Angles for pan and tilt in Radians
        self.pan = data.data[0]
        self.tilt = data.data[1]
    
    def update_gimbal(self):
        if(self.params["override_gimbal"] == True):  
  
            pan_deg = self.params["gimbal_yaw"]
            tilt_deg = self.params["gimbal_pitch"]

            pan_rad = pan_deg*np.pi/180.0
            tilt_rad = tilt_deg*np.pi/180.0      

            print("pan: %.3f tilt: %.3f"%(pan_rad,tilt_rad))
            self.update_servo(DXL_ID_LINK_1, helper.clamp((pan_rad*self.pan_scale + self.pan_offset),-np.pi,np.pi))
            self.update_servo(DXL_ID_LINK_2, helper.clamp((-tilt_rad*self.tilt_scale + self.tilt_offset),-np.pi,np.pi))
            
        else:
            print("pan: %.3f tilt: %.3f"%(self.pan,self.tilt))
            self.update_servo(DXL_ID_LINK_1, helper.clamp((self.pan*self.pan_scale + self.pan_offset),-np.pi,np.pi))
            self.update_servo(DXL_ID_LINK_2, helper.clamp((-self.tilt*self.tilt_scale + self.tilt_offset),-np.pi,np.pi))
            print(self.pan*self.pan_scale + self.pan_offset)

    def loop(self):
        while(not rospy.is_shutdown()):
            self.update_gimbal()
            self.rate.sleep()

if __name__ == "__main__":
    rospy.init_node("gimbal_driver", anonymous=False)
    rospy.loginfo("Starting gimbal driver node")
    obj = GimbalDriver()
    try:
        rospy.spin()
    except Exception as e:
        print(str(e))

    # print("Exiting")
    # time.sleep(0.1)
    # stopped = False
    # # Disable Dynamixel Torque
    # while stopped == False:
    #     dxl_comm_result_1, dxl_error = packetHandler.write1ByteTxRx(
    #         portHandler, DXL_ID_LINK_1, ADDR_TORQUE_ENABLE, TORQUE_DISABLE
    #     )
    #     dxl_comm_result_2, dxl_error = packetHandler.write1ByteTxRx(
    #         portHandler, DXL_ID_LINK_2, ADDR_TORQUE_ENABLE, TORQUE_DISABLE
    #     )

    #     if (dxl_comm_result_1 and dxl_comm_result_2) == COMM_SUCCESS:
    #         if dxl_error == 0:
    #             stopped = True

    # # Close port
    # print("closing Port")
    # portHandler.closePort()
