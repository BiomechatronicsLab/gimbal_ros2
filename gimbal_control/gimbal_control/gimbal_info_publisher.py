# Copyright 2016 Open Source Robotics Foundation, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import rclpy
from rclpy.node import Node

from std_msgs.msg import String
from gimbal_interface.msg import Gimbal                          
from std_msgs.msg import Float64, Float64MultiArray


# import bagpy
# from bagpy import bagreader

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

import os, sys
sys.path.append(os.getcwd())


class GimbalPublisher(Node):

    def __init__(self):
        super().__init__('gimbal_publisher')
        self.ts = 0

        # rosbag_cmd_file = '/home/bml/ONR_ws/src/hardware/gimbal_ros2/gimbal_control/gimbal_control/2023-12-11-21-11-58/demo-gimbal_cmd.csv'
        rosbag_cmd_path = self.declare_parameter('rosbag_cmd_path').value
        rosbag_cmd_file = rosbag_cmd_path + '2023-12-11-21-11-58/demo-gimbal_cmd.csv'
        gimbal_cmd_data = pd.read_csv(rosbag_cmd_file)
        # print("data =\b", gimbal_cmd_data)
        self.gimbal_pan = gimbal_cmd_data['data_0'] / (2*np.pi)*4096
        self.gimbal_tilt = gimbal_cmd_data['data_1'] / (2*np.pi)*4096 

        self.publisher_ = self.create_publisher(Gimbal, 'gimbal_topic', 10)  # CHANGE
        timer_period = 0.01  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        

    def timer_callback(self):
        # msg = String()
        msg = Gimbal()                                            
        msg.pan = self.gimbal_pan[self.ts + 3500] 
        msg.tilt = self.gimbal_tilt[self.ts + 3500]                                     
        self.publisher_.publish(msg)
        self.get_logger().info('Publishing on Gimbal msg: timestep %d, msg_pan = %f, msg_tilt = %f ' %(self.ts, msg.pan, msg.tilt))     
        self.ts += 1




def main(args=None):
    rclpy.init(args=args)

    gimbal_publisher = GimbalPublisher()

    rclpy.spin(gimbal_publisher)

    gimbal_publisher.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
