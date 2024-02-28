// generated from rosidl_typesupport_introspection_c/resource/idl__type_support.c.em
// with input from gimbal_interfaces:msg/Gimbal.idl
// generated code does not contain a copyright notice

#include <stddef.h>
#include "gimbal_interfaces/msg/detail/gimbal__rosidl_typesupport_introspection_c.h"
#include "gimbal_interfaces/msg/rosidl_typesupport_introspection_c__visibility_control.h"
#include "rosidl_typesupport_introspection_c/field_types.h"
#include "rosidl_typesupport_introspection_c/identifier.h"
#include "rosidl_typesupport_introspection_c/message_introspection.h"
#include "gimbal_interfaces/msg/detail/gimbal__functions.h"
#include "gimbal_interfaces/msg/detail/gimbal__struct.h"


#ifdef __cplusplus
extern "C"
{
#endif

void gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_init_function(
  void * message_memory, enum rosidl_runtime_c__message_initialization _init)
{
  // TODO(karsten1987): initializers are not yet implemented for typesupport c
  // see https://github.com/ros2/ros2/issues/397
  (void) _init;
  gimbal_interfaces__msg__Gimbal__init(message_memory);
}

void gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_fini_function(void * message_memory)
{
  gimbal_interfaces__msg__Gimbal__fini(message_memory);
}

static rosidl_typesupport_introspection_c__MessageMember gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_message_member_array[2] = {
  {
    "pan",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_DOUBLE,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(gimbal_interfaces__msg__Gimbal, pan),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL,  // fetch(index, &value) function pointer
    NULL,  // assign(index, value) function pointer
    NULL  // resize(index) function pointer
  },
  {
    "tilt",  // name
    rosidl_typesupport_introspection_c__ROS_TYPE_DOUBLE,  // type
    0,  // upper bound of string
    NULL,  // members of sub message
    false,  // is array
    0,  // array size
    false,  // is upper bound
    offsetof(gimbal_interfaces__msg__Gimbal, tilt),  // bytes offset in struct
    NULL,  // default value
    NULL,  // size() function pointer
    NULL,  // get_const(index) function pointer
    NULL,  // get(index) function pointer
    NULL,  // fetch(index, &value) function pointer
    NULL,  // assign(index, value) function pointer
    NULL  // resize(index) function pointer
  }
};

static const rosidl_typesupport_introspection_c__MessageMembers gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_message_members = {
  "gimbal_interfaces__msg",  // message namespace
  "Gimbal",  // message name
  2,  // number of fields
  sizeof(gimbal_interfaces__msg__Gimbal),
  gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_message_member_array,  // message members
  gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_init_function,  // function to initialize message memory (memory has to be allocated)
  gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_fini_function  // function to terminate message instance (will not free memory)
};

// this is not const since it must be initialized on first access
// since C does not allow non-integral compile-time constants
static rosidl_message_type_support_t gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_message_type_support_handle = {
  0,
  &gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_message_members,
  get_message_typesupport_handle_function,
};

ROSIDL_TYPESUPPORT_INTROSPECTION_C_EXPORT_gimbal_interfaces
const rosidl_message_type_support_t *
ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_introspection_c, gimbal_interfaces, msg, Gimbal)() {
  if (!gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_message_type_support_handle.typesupport_identifier) {
    gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_message_type_support_handle.typesupport_identifier =
      rosidl_typesupport_introspection_c__identifier;
  }
  return &gimbal_interfaces__msg__Gimbal__rosidl_typesupport_introspection_c__Gimbal_message_type_support_handle;
}
#ifdef __cplusplus
}
#endif
