from setuptools import find_packages
from setuptools import setup

setup(
    name='gimbal_interface',
    version='0.0.0',
    packages=find_packages(
        include=('gimbal_interface', 'gimbal_interface.*')),
)
