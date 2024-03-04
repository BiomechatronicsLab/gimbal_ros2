from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='gimbal_control',
            executable='gimbal_pub',
            name='gimbal_pub',
            parameters=[
            # {"rosbag_cmd_file": '/home/bml/ONR_ws/src/hardware/gimbal_ros2/gimbal_control/gimbal_control/2023-12-11-21-11-58/demo-gimbal_cmd.csv'}
            {"rosbag_cmd_file": '/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/src/gimbal_control/gimbal_control/2023-12-11-21-11-58/demo-gimbal_cmd.csv'}
            ]
        ),

        Node(
            package='gimbal_control',
            executable='gimbal_ctrl_pos_mode',
            name='gimbal_ctrl_pos_mode',
            parameters=[
            # {"usb_port": '/dev/serial/by-id/usb-FTDI_USB__-__Serial_Converter_FT2GXBHC-if00-port0'},
            {"usb_port": '/dev/tty.usbserial-FT6Z5UZP'},
            ]
        )
    ])