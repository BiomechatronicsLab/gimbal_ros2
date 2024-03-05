from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        #  Node(
        #     package='gimbal_control',
        #     executable='gimbal_pub',
        #     name='gimbal_pub',
        #     parameters=[
        #     # {"rosbag_cmd_path": '/home/bml/ONR_ws/src/hardware/gimbal_ros2/gimbal_control/gimbal_control/'},
        #     {"rosbag_cmd_path": '/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/src/gimbal_control/gimbal_control/'},
        #     ]
        # ),

        Node(
            package='gimbal_control',
            executable='gimbal_ctrl_vel_mode',
            name='gimbal_ctrl_vel_mode',
            parameters=[
            # {"usb_port": '/dev/serial/by-id/usb-FTDI_USB__-__Serial_Converter_FT2GXBHC-if00-port0'},
            {"usb_port": '/dev/tty.usbserial-FT6Z5UZP'},
            ]
        )
    ])