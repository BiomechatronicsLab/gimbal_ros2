# Install script for directory: /Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/src/gimbal_interface

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/install/gimbal_interface")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/rosidl_interfaces" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_index/share/ament_index/resource_index/rosidl_interfaces/gimbal_interface")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gimbal_interface/gimbal_interface" TYPE DIRECTORY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_generator_c/gimbal_interface/" REGEX "/[^/]*\\.h$")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/environment" TYPE FILE FILES "/Users/huajingzhao/ros2/humble/build/ament_package/ament_package/template/environment_hook/library_path.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/environment" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_environment_hooks/library_path.dsv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/libgimbal_interface__rosidl_generator_c.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_generator_c.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_generator_c.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/huajingzhao/ros2/humble/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_generator_c.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_generator_c.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gimbal_interface/gimbal_interface" TYPE DIRECTORY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_typesupport_fastrtps_c/gimbal_interface/" REGEX "/[^/]*\\.cpp$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/libgimbal_interface__rosidl_typesupport_fastrtps_c.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_fastrtps_c.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_fastrtps_c.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/huajingzhao/ros2/humble/install/lib"
      -delete_rpath "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_fastrtps_c.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_fastrtps_c.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gimbal_interface/gimbal_interface" TYPE DIRECTORY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_typesupport_introspection_c/gimbal_interface/" REGEX "/[^/]*\\.h$")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/libgimbal_interface__rosidl_typesupport_introspection_c.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_introspection_c.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_introspection_c.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface"
      -delete_rpath "/Users/huajingzhao/ros2/humble/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_introspection_c.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_introspection_c.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/libgimbal_interface__rosidl_typesupport_c.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_c.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_c.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface"
      -delete_rpath "/Users/huajingzhao/ros2/humble/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_c.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_c.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gimbal_interface/gimbal_interface" TYPE DIRECTORY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_generator_cpp/gimbal_interface/" REGEX "/[^/]*\\.hpp$")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gimbal_interface/gimbal_interface" TYPE DIRECTORY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_typesupport_fastrtps_cpp/gimbal_interface/" REGEX "/[^/]*\\.cpp$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/libgimbal_interface__rosidl_typesupport_fastrtps_cpp.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_fastrtps_cpp.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_fastrtps_cpp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/huajingzhao/ros2/humble/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_fastrtps_cpp.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_fastrtps_cpp.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gimbal_interface/gimbal_interface" TYPE DIRECTORY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_typesupport_introspection_cpp/gimbal_interface/" REGEX "/[^/]*\\.hpp$")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/libgimbal_interface__rosidl_typesupport_introspection_cpp.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_introspection_cpp.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_introspection_cpp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/huajingzhao/ros2/humble/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_introspection_cpp.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_introspection_cpp.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/libgimbal_interface__rosidl_typesupport_cpp.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_cpp.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_cpp.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/huajingzhao/ros2/humble/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_cpp.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_typesupport_cpp.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/environment" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_environment_hooks/pythonpath.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/environment" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_environment_hooks/pythonpath.dsv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface-0.0.0-py3.12.egg-info" TYPE DIRECTORY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_python/gimbal_interface/gimbal_interface.egg-info/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface" TYPE DIRECTORY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_generator_py/gimbal_interface/" REGEX "/[^/]*\\.pyc$" EXCLUDE REGEX "/\\_\\_pycache\\_\\_$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(
        COMMAND
        "/opt/homebrew/Frameworks/Python.framework/Versions/3.12/bin/python3.12" "-m" "compileall"
        "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/install/gimbal_interface/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface"
      )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface" TYPE SHARED_LIBRARY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_generator_py/gimbal_interface/gimbal_interface_s__rosidl_typesupport_fastrtps_c.cpython-310-darwin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_fastrtps_c.cpython-310-darwin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_fastrtps_c.cpython-310-darwin.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_generator_py/gimbal_interface"
      -delete_rpath "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface"
      -delete_rpath "/Users/huajingzhao/ros2/humble/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_fastrtps_c.cpython-310-darwin.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_fastrtps_c.cpython-310-darwin.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/gimbal_interface__rosidl_typesupport_fastrtps_c__pyext.dir/install-cxx-module-bmi-noconfig.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface" TYPE SHARED_LIBRARY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_generator_py/gimbal_interface/gimbal_interface_s__rosidl_typesupport_introspection_c.cpython-310-darwin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_introspection_c.cpython-310-darwin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_introspection_c.cpython-310-darwin.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_generator_py/gimbal_interface"
      -delete_rpath "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface"
      -delete_rpath "/Users/huajingzhao/ros2/humble/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_introspection_c.cpython-310-darwin.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_introspection_c.cpython-310-darwin.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/gimbal_interface__rosidl_typesupport_introspection_c__pyext.dir/install-cxx-module-bmi-noconfig.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface" TYPE SHARED_LIBRARY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_generator_py/gimbal_interface/gimbal_interface_s__rosidl_typesupport_c.cpython-310-darwin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_c.cpython-310-darwin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_c.cpython-310-darwin.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_generator_py/gimbal_interface"
      -delete_rpath "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface"
      -delete_rpath "/Users/huajingzhao/ros2/humble/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_c.cpython-310-darwin.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/../../../../../../../../../opt/homebrew/lib/python3.12/site-packages/gimbal_interface/gimbal_interface_s__rosidl_typesupport_c.cpython-310-darwin.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  include("/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/gimbal_interface__rosidl_typesupport_c__pyext.dir/install-cxx-module-bmi-noconfig.cmake" OPTIONAL)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_generator_py/gimbal_interface/libgimbal_interface__rosidl_generator_py.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_generator_py.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_generator_py.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface"
      -delete_rpath "/Users/huajingzhao/ros2/humble/install/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_generator_py.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgimbal_interface__rosidl_generator_py.dylib")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/msg" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_adapter/gimbal_interface/msg/Gimbal.idl")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/msg" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/src/gimbal_interface/msg/Gimbal.msg")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/package_run_dependencies" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_index/share/ament_index/resource_index/package_run_dependencies/gimbal_interface")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/parent_prefix_path" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_index/share/ament_index/resource_index/parent_prefix_path/gimbal_interface")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/environment" TYPE FILE FILES "/Users/huajingzhao/ros2/humble/install/share/ament_cmake_core/cmake/environment_hooks/environment/ament_prefix_path.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/environment" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_environment_hooks/ament_prefix_path.dsv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/environment" TYPE FILE FILES "/Users/huajingzhao/ros2/humble/install/share/ament_cmake_core/cmake/environment_hooks/environment/path.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/environment" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_environment_hooks/path.dsv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_environment_hooks/local_setup.bash")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_environment_hooks/local_setup.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_environment_hooks/local_setup.zsh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_environment_hooks/local_setup.dsv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_environment_hooks/package.dsv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ament_index/resource_index/packages" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_index/share/ament_index/resource_index/packages/gimbal_interface")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_cExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_cExport.cmake"
         "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_generator_cExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_cExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_cExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_generator_cExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_generator_cExport-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_typesupport_fastrtps_cExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_typesupport_fastrtps_cExport.cmake"
         "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_typesupport_fastrtps_cExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_typesupport_fastrtps_cExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_typesupport_fastrtps_cExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_typesupport_fastrtps_cExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_typesupport_fastrtps_cExport-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_introspection_cExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_introspection_cExport.cmake"
         "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_introspection_cExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_introspection_cExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_introspection_cExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_introspection_cExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_introspection_cExport-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_cExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_cExport.cmake"
         "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_cExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_cExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_cExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_cExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_cExport-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_cppExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_cppExport.cmake"
         "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_generator_cppExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_cppExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_cppExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_generator_cppExport.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_typesupport_fastrtps_cppExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_typesupport_fastrtps_cppExport.cmake"
         "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_typesupport_fastrtps_cppExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_typesupport_fastrtps_cppExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_typesupport_fastrtps_cppExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_typesupport_fastrtps_cppExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_typesupport_fastrtps_cppExport-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_introspection_cppExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_introspection_cppExport.cmake"
         "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_introspection_cppExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_introspection_cppExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_introspection_cppExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_introspection_cppExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_introspection_cppExport-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_cppExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_cppExport.cmake"
         "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_cppExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_cppExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/gimbal_interface__rosidl_typesupport_cppExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_cppExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/gimbal_interface__rosidl_typesupport_cppExport-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_pyExport.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_pyExport.cmake"
         "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_generator_pyExport.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_pyExport-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake/export_gimbal_interface__rosidl_generator_pyExport.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_generator_pyExport.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/CMakeFiles/Export/1e85c516daf577f4511f344db3bbbb2e/export_gimbal_interface__rosidl_generator_pyExport-noconfig.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_cmake/rosidl_cmake-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_export_include_directories/ament_cmake_export_include_directories-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_export_libraries/ament_cmake_export_libraries-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_export_targets/ament_cmake_export_targets-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_cmake/rosidl_cmake_export_typesupport_targets-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_export_dependencies/ament_cmake_export_dependencies-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/rosidl_cmake/rosidl_cmake_export_typesupport_libraries-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface/cmake" TYPE FILE FILES
    "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_core/gimbal_interfaceConfig.cmake"
    "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/ament_cmake_core/gimbal_interfaceConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gimbal_interface" TYPE FILE FILES "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/src/gimbal_interface/package.xml")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/gimbal_interface__py/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/huajingzhao/Desktop/UCLA/projects/neureality/gimbal_ws/build/gimbal_interface/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
