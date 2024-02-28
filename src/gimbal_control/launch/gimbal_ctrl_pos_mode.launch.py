from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='gimbal_control',
            executable='gimbal_pub',
            name='gimbal_pub',
        ),

        Node(
            package='gimbal_control',
            executable='gimbal_ctrl_pos_mode',
            name='gimbal_ctrl_pos_mode',
        )
    ])