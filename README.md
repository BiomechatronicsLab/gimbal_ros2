**ROS2-based Camera Gimbal Control**

- Sample gimbal commands (pan/tilt) are published using gimbal_info_publisher.py
  - in terminal: ```ros2 run gimbal_control gimbal_pub'''
- Dynamixel motor control can be executed using:
  - velocity-based control (smooth, recommended): ```ros2 run gimbal_control gimbal_ctrl_vel_mode'''
  - position-based control (not smooth, for comparison): ```ros2 run gimbal_control gimbal_ctrl_pos_mode'''

- If using launch files to run the scripts:
  - For velocity based dynamixel control: ```ros2 launch gimbal_control gimbal_ctrl_vel_mode.launch.py'''
  - For position based dynamixel control: ```ros2 launch gimbal_control gimbal_ctrl_pos_mode.launch.py"'''
