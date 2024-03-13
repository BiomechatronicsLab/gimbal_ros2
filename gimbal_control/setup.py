from setuptools import find_packages, setup

import os
from glob import glob

package_name = 'gimbal_control'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']	),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        (os.path.join('share', package_name), glob('launch/*launch.[pxy][yma]*')), # added for set parameters with launch files (/launch/*_launch.pu)
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='huajingzhao',
    maintainer_email='huajing_zhao@berkeley.edu',
    description='Package description: A ROS2 package to control camera gimbal',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'gimbal_pub = gimbal_control.gimbal_info_publisher:main',
            'gimbal_sub = gimbal_control.gimbal_info_subscriber:main',
            'gimbal_ctrl_pos_mode = gimbal_control.gimbal_control_ros2_position:main',
            'gimbal_ctrl_vel_mode = gimbal_control.gimbal_control_ros2_velocity:main',
        ],
    },
)
