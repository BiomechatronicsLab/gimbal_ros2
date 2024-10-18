# **ROS2-based Camera Gimbal Control**

# Gimbal ROS2 Interface
- This repo contains code relevant to running the Biomechatronics Lab 2DOF Gimbal for Camera Tracking.

## Table of Contents

- [Dependencies](#dependencies)
- [Setup Instructions](#setup-instructions)
- [Running the Gimbal](#running-the-gimbal)
- [Debugging](#debugging)

## Dependencies
The table below lists the direct dependencies needed for this repository.

| **Dependency Name**                                                          | **Description**                                                                   |
|------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| [dynamixel-sdk](https://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/)                          | DYNAMIXEL SDK is a software development kit that provides DYNAMIXEL control functions using packet communication.|

## Setup Instructions

### Software Setup
Follow these steps to set up 2DOF Gimbal:

1. **Clone the Repository**:
   ```bash
   git clone git@github.com:BiomechatronicsLab/gimbal_ros2.git
   ```

2. **Install Dependencies**:
   Ensure you have Python packages required for the project:
   ```bash
   cd your-repo-directory
   pip install -r requirements.txt
   ```
   
3. **Compile the Package**:
   Build the package using `colcon`:
   ```bash
   colcon build --packages-select gimbal_ros2 --symlink-install
   ```

## Running the Gimbal
   
1. **Create and Edit Configuration File**:
   Copy the default parameters:
   ```bash
   cp path/to/default_params.yaml path/to/your/config.yaml
   ```
   Modify `config.yaml` as needed to set your desired parameters.

2. **Launch the Driver**:
   Execute the following command, specifying the path to your configuration file:
   ```bash
   ros2 launch gimbal_ros2 gimbal_launch.py config_file:=filename.yaml
   ```

3. **Run Gimbal Demo**:
   Exectue the following command for the gimbal to move in a set trajectory:
   ```bash
   ros2 run gimbal_ros2 demo_gimbal_motion.py 
   ```


## Debugging

1. If no motors show up, check that your serial port permissions are correct. Try this command: `sudo usermod -aG dialout $USER` and reboot the computer
2. If necessary, update usb timing, seen in section 6.8.1.2 of [Dynamixel Wizard manual](https://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_wizard2/)