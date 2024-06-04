#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
import numpy as np
import keyboard
from sensor_msgs.msg import JointState
import threading
import rclpy.logging
import time


class TeleopNode(Node):
    def __init__(self):
        super().__init__('teleop_node')
        self.publisher_ = self.create_publisher(JointState, 'gimbal', 10)
        self.pitch = 0
        self.yaw = 0    
        self.logger = self.get_logger()
        self.angle_increment = 0.087  # Adjust this value as needed
        

    def publish_yaw_pitch(self):
        msg = JointState()
        msg.name = ["yaw", "pitch"]
        msg.position = [float(self.yaw), float(self.pitch)]
        self.publisher_.publish(msg)
        # Log a message
        self.logger.info("Publishing New Yaw and Pitch Values: %f, %f" % (self.yaw, self.pitch))

    def run(self):
        while rclpy.ok():
            if keyboard.is_pressed('s'):
                break

            elif keyboard.is_pressed('w'):
                self.pitch = self.pitch + self.angle_increment * np.pi / 180

            elif keyboard.is_pressed('x'):
                self.pitch = self.pitch - self.angle_increment * np.pi / 180

            elif keyboard.is_pressed('a'):
                self.yaw = self.yaw - self.angle_increment * np.pi / 180

            elif keyboard.is_pressed('d'):
                self.yaw = self.yaw + self.angle_increment * np.pi / 180

            elif keyboard.is_pressed('e'):
                self.pitch = self.pitch + self.angle_increment * np.pi / 180
                self.yaw = self.yaw + self.angle_increment * np.pi / 180

            elif keyboard.is_pressed('z'):
                self.pitch = self.pitch - self.angle_increment * np.pi / 180
                self.yaw = self.yaw - self.angle_increment * np.pi / 180

            elif keyboard.is_pressed('c'):
                self.pitch = self.pitch - self.angle_increment * np.pi / 180
                self.yaw = self.yaw + self.angle_increment * np.pi / 180

            elif keyboard.is_pressed('q'):
                self.pitch = self.pitch + self.angle_increment * np.pi / 180
                self.yaw = self.yaw - self.angle_increment * np.pi / 180

            self.publish_yaw_pitch()

        self.destroy_node()
        rclpy.shutdown()

def main(args=None):
    rclpy.init(args=args)
    teleop_node = TeleopNode()
    # Create a separate thread for running the teleop_node
    thread = threading.Thread(target=teleop_node.run)
    thread.start()
    rclpy.spin(teleop_node)

if __name__ == '__main__':
    main()