cmake_minimum_required(VERSION 3.22)
project(gimbal_ros2)


set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "-Wall -Wextra -O3 -std=c++17")
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_FLAGS "-Wall -Wextra -O3 -std=c11")
set(CMAKE_LANGUAGE CXX)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    add_compile_options(-Wall -Wextra -Wpedantic)
endif()

if(APPLE)
    set(Python3_ROOT_DIR $ENV{HOME}/ros2/venv)
    find_package(Python3 EXACT 3.10 REQUIRED)
endif()

if(DEFINED ENV{VIRTUAL_ENV} OR DEFINED ENV{CONDA_PREFIX})
    set(pip_args -r ${CMAKE_CURRENT_SOURCE_DIR}/requirements.txt)
else()
    set(pip_args --user -r ${CMAKE_CURRENT_SOURCE_DIR}/requirements.txt)
endif()

# Add target for libdatachannel (a lightweight and cross-platform WebRTC C++ library)
include_directories(
    ${Python3_ROOT_DIR}/include/python3.10 ${Python3_ROOT_DIR}/include include
)
link_directories(${Python3_ROOT_DIR}/lib ${Python3_ROOT_DIR}/lib/python3.10)


find_package(ament_cmake)
find_package(rosidl_default_generators REQUIRED)
find_package(builtin_interfaces REQUIRED)
find_package(std_msgs REQUIRED)

execute_process(
    COMMAND_ECHO STDOUT
    COMMAND_ERROR_IS_FATAL ANY
    COMMAND ${Python3_EXECUTABLE} -m pip install ${pip_args}
)

rosidl_generate_interfaces(${PROJECT_NAME}
    msg/Gimbal.msg
    DEPENDENCIES builtin_interfaces std_msgs
)

# Install Python executables
install(
    DIRECTORY scripts/
    DESTINATION lib/${PROJECT_NAME}/
    FILE_PERMISSIONS
    OWNER_EXECUTE GROUP_EXECUTE WORLD_EXECUTE OWNER_WRITE OWNER_READ WORLD_READ
)


# Install launch files.
install(
    DIRECTORY launch/
    DESTINATION share/${PROJECT_NAME}/
    FILE_PERMISSIONS
    OWNER_EXECUTE GROUP_EXECUTE WORLD_EXECUTE OWNER_WRITE OWNER_READ WORLD_READ
)

# Install udev rule
if (NOT EXISTS /etc/udev/rules.d/89-dynamixel.rules)
    message("\n\nPlease enter computer password: ")
    execute_process(
        COMMAND sudo chmod 777 /etc/udev/rules.d
    )
    install(
        FILES ${CMAKE_SOURCE_DIR}/89-dynamixel.rules
        DESTINATION /etc/udev/rules.d/
        PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ
    )
    execute_process(
        COMMAND sudo chmod 755 /etc/udev/rules.d
    )
endif()

ament_export_dependencies(
    rosidl_default_runtime builtin_interfaces std_msgs
)
ament_package()
