from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    dynamixel_usb_port = (
        "/dev/serial/by-id/usb-FTDI_USB__-__Serial_Converter_FT6Z5UZP-if00-port0"
    )
    return LaunchDescription(
        [
            Node(
                package="gimbal_ros2",
                executable="gimbal_control_ros2_position.py",
                name="gimbal_ctrl_pos_mode",
                parameters=[{"usb_port": dynamixel_usb_port}],
            )
        ]
    )


if __name__ == "__main__":
    generate_launch_description()
