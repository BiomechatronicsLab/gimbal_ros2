ROS2-based Camera Gimbal Control

- Sample gimbal commands (pan/tilt) are published using gimbal_info_publisher.py (in terminal: "ros2 run gimbal_control gimbal_sub")
- Dynamixel control can be executed using:
  - velocity-based motor control (smooth, recommended): "ros2 run gimbal_control gimbal_ctrl_vel_mode"
  - position-based motor control (not smooth, for comparison): "ros2 run gimbal_control gimbal_ctrl_pos_mode"

- If using launch file to run the scripts:
  - For velocity based dynamixel control, run: "ros2 launch gimbal_control gimbal_ctrl_vel_mode.launch.py"
  - For position based dynamixel control, run: "ros2 launch gimbal_control gimbal_ctrl_pos_mode.launch.py" 
