import rclpy.logging
from launch import LaunchDescription
import launch.logging
from launch.actions import ExecuteProcess
from launch_ros.actions import Node


def generate_launch_description():
    dynamixel_usb_port = (
        "/dev/serial/by-id/usb-FTDI_USB__-__Serial_Converter_FT6Z5UZP-if00-port0"
    )
    return LaunchDescription(
        [
            Node(
                package="gimbal_ros2",
                executable="gimbal_control_ros2_velocity.py",
                output="screen",
                name="gimbal_ctrl_vel_mode",
                parameters=[{"usb_port": dynamixel_usb_port}],
                emulate_tty=True
            )
        ]
    )


if __name__ == "__main__":
    generate_launch_description()
