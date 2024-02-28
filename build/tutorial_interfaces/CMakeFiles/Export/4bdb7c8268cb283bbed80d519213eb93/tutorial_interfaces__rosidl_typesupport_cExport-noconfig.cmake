#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "tutorial_interfaces::tutorial_interfaces__rosidl_typesupport_c" for configuration ""
set_property(TARGET tutorial_interfaces::tutorial_interfaces__rosidl_typesupport_c APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(tutorial_interfaces::tutorial_interfaces__rosidl_typesupport_c PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_NOCONFIG "rosidl_runtime_c::rosidl_runtime_c;rosidl_typesupport_c::rosidl_typesupport_c"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libtutorial_interfaces__rosidl_typesupport_c.dylib"
  IMPORTED_SONAME_NOCONFIG "@rpath/libtutorial_interfaces__rosidl_typesupport_c.dylib"
  )

list(APPEND _cmake_import_check_targets tutorial_interfaces::tutorial_interfaces__rosidl_typesupport_c )
list(APPEND _cmake_import_check_files_for_tutorial_interfaces::tutorial_interfaces__rosidl_typesupport_c "${_IMPORT_PREFIX}/lib/libtutorial_interfaces__rosidl_typesupport_c.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
