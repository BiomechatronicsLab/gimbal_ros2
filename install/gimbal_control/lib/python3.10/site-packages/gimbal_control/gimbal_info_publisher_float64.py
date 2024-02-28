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
from tutorial_interfaces.msg import Num, Float, Gimbal                           # CHANGE
from std_msgs.msg import Float64, Float64MultiArray


# import bagpy
# from bagpy import bagreader

import matplotlib.pyplot as plt
import pandas as pd


class MinimalPublisher(Node):

     # def read_gimbal_cmd(self):
     #    # b = bagreader('2023-12-11-21-11-58.bag') # already exported from script read_rosbag_bagpy.py into csvs.
     #    # print("b.topic_table =\n",  b.topic_table)
     #    # csvfiles = []
     #    # for i in b.topics:
     #    #     data = b.message_by_topic(i)
     #    #     csvfiles.append(data)

     #    rosbag_cmd_file = './2023-12-11-21-11-58/demo-gimbal_cmd.csv'
     #    gimbal_cmd_data = pd.read_csv(csvfiles[0])
     #    print("data =\b", gimbal_cmd_data)

     #    print("gimbal_pan =\n", gimbal_cmd_data['data_0'])
     #    print("gimbal_tilte =\n", gimbal_cmd_data['data_1'])

    def __init__(self):
        super().__init__('minimal_publisher')
        self.ts = 0

        rosbag_cmd_file = '/Users/huajingzhao/Desktop/UCLA/projects/ros2_ws/src/gimbal_control/gimbal_control/2023-12-11-21-11-58/demo-gimbal_cmd.csv'
        gimbal_cmd_data = pd.read_csv(rosbag_cmd_file)
        # print("data =\b", gimbal_cmd_data)
        self.gimbal_pan = gimbal_cmd_data['data_0']
        self.gimbal_tilt = gimbal_cmd_data['data_1']

        # self.publisher_ = self.create_publisher(String, 'topic', 10)
        self.publisher_ = self.create_publisher(Float64, 'topic', 10)  # CHANGE
        timer_period = 0.01  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        

    def timer_callback(self):
        # msg = String()
        # msg.data = 'Hello World: %d' % self.i
        msg = Float64()                                               # CHANGE
        msg.data = self.gimbal_pan[self.ts]                                       # CHANGE
        self.publisher_.publish(msg)
        # self.get_logger().info('Publishing: "%s"' % msg.data)
        self.get_logger().info('Publishing Test on Float: "%f"' % msg.data)       # CHANGE
        print("msg.data = ", msg.data)
        print("timestep = ", self.ts)
        self.ts += 1




def main(args=None):
    rclpy.init(args=args)

    minimal_publisher = MinimalPublisher()

    rclpy.spin(minimal_publisher)

    # Destroy the node explicitly
    # (optional - otherwise it will be done automatically
    # when the garbage collector destroys the node object)
    minimal_publisher.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
