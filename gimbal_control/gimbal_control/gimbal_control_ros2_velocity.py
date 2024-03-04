from dynio import * # https://pypi.org/project/dynamixel-controller/
import time
import csv
import numpy as np

import rclpy
from rclpy.node import Node


# from std_msgs.msg import String
from gimbal_interface.msg import Gimbal                         

# note: NEED to run gimbal_pub at another terminal to receive sample motor positions


class GimbalSubscriber(Node):
    def __init__(self):
        
        super().__init__('gimbal_subscriber')

        # initialize dynamixel
        self.PORTNAME = self.declare_parameter('usb_port').value
        dxl_io = dxl.DynamixelIO(device_name=self.PORTNAME, baud_rate=57600) # your port for U2D2 or other serial device

        self.gimbal_pan = dxl_io.new_mx64(dxl_id=0, protocol=2)   
        self.gimbal_tilt = dxl_io.new_mx64(dxl_id=1, protocol=2)

        self.ts = 0

        self.gimbal_pan.torque_disable()         # you have to disable torque before you change modes
        self.gimbal_pan.set_velocity_mode()
        self.gimbal_pan.torque_enable() 

        self.gimbal_tilt.torque_disable()        # you have to disable torque before you change modes
        self.gimbal_tilt.set_velocity_mode()
        self.gimbal_tilt.torque_enable() 

        self.pos_pan_0 = self.gimbal_pan.get_position()
        self.pos_tilt_0 = self.gimbal_tilt.get_position()

        self.msg_pan_0 = None
        self.msg_tilt_0 = None
        self.pos_pan_prev = None
        self.pos_tilt_prev = None

        self.subscription = self.create_subscription(Gimbal, 'gimbal_topic', self.listener_callback, 10)
        self.subscription


    def listener_callback(self, msg):
        self.get_logger().info('Subscription: msg_pan = %f, msg_tilt = %f' %(msg.pan, msg.tilt))

        if self.ts == 0:
            self.msg_pan_0 = msg.pan
            self.msg_tilt_0 = msg.tilt

            self.gimbal_pan.set_velocity(0)
            self.gimbal_tilt.set_velocity(0)

            self.pos_pan = self.pos_pan_0
            self.pos_tilt = self.pos_tilt_0
            self.pos_pan_prev = self.pos_pan_0
            self.pos_tilt_prev = self.pos_tilt_0

        else:
            self.pos_pan = msg.pan              # + self.pos_pan_0  - self.msg_pan_0      # uncomment if want to track relative movements of the headset, otherwise will track the absolute values of headset angles
            self.pos_tilt = msg.tilt            # + self.pos_tilt_0 - self.msg_tilt_0     # uncomment if want to track relative movements of the headset, otherwise will track the absolute values of headset angles

            self.velocity_pan = self.pos_pan - self.pos_pan_prev
            self.velocity_tilt = self.pos_tilt - self.pos_tilt_prev

            self.gimbal_pan.set_velocity(int(self.velocity_pan))
            self.gimbal_tilt.set_velocity(int(self.velocity_tilt))

            self.pos_pan_prev = self.pos_pan
            self.pos_tilt_prev = self.pos_tilt

            print("output_pan = %f, output_tilt = %f, set velocity_pan = %f, set velocity_tilt = %f" %(self.gimbal_pan.get_position(), self.gimbal_tilt.get_position(), self.velocity_pan, self.velocity_tilt))
        self.ts += 1

    def __del__(self):
        
        # turn off the motors
        self.gimbal_pan.set_velocity(0)
        self.gimbal_pan.torque_disable()

        self.gimbal_tilt.set_velocity(0)
        self.gimbal_tilt.torque_disable()

def main(args=None):
    rclpy.init(args=args)

    # run ros2 callback with subscriber to desired dynamxiel positions and update commands to physical motors 
    gimbal_subscriber = GimbalSubscriber()
    rclpy.spin(gimbal_subscriber)

    # destroy the node explicitly  (optional - otherwise it will be done automatically when the garbage collector destroys the node object)
    gimbal_subscriber.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()



