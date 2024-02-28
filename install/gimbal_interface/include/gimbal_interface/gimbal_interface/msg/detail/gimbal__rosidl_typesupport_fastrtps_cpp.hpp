// generated from rosidl_typesupport_fastrtps_cpp/resource/idl__rosidl_typesupport_fastrtps_cpp.hpp.em
// with input from gimbal_interface:msg/Gimbal.idl
// generated code does not contain a copyright notice

#ifndef GIMBAL_INTERFACE__MSG__DETAIL__GIMBAL__ROSIDL_TYPESUPPORT_FASTRTPS_CPP_HPP_
#define GIMBAL_INTERFACE__MSG__DETAIL__GIMBAL__ROSIDL_TYPESUPPORT_FASTRTPS_CPP_HPP_

#include "rosidl_runtime_c/message_type_support_struct.h"
#include "rosidl_typesupport_interface/macros.h"
#include "gimbal_interface/msg/rosidl_typesupport_fastrtps_cpp__visibility_control.h"
#include "gimbal_interface/msg/detail/gimbal__struct.hpp"

#ifndef _WIN32
# pragma GCC diagnostic push
# pragma GCC diagnostic ignored "-Wunused-parameter"
# ifdef __clang__
#  pragma clang diagnostic ignored "-Wdeprecated-register"
#  pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
# endif
#endif
#ifndef _WIN32
# pragma GCC diagnostic pop
#endif

#include "fastcdr/Cdr.h"

namespace gimbal_interface
{

namespace msg
{

namespace typesupport_fastrtps_cpp
{

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_gimbal_interface
cdr_serialize(
  const gimbal_interface::msg::Gimbal & ros_message,
  eprosima::fastcdr::Cdr & cdr);

bool
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_gimbal_interface
cdr_deserialize(
  eprosima::fastcdr::Cdr & cdr,
  gimbal_interface::msg::Gimbal & ros_message);

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_gimbal_interface
get_serialized_size(
  const gimbal_interface::msg::Gimbal & ros_message,
  size_t current_alignment);

size_t
ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_gimbal_interface
max_serialized_size_Gimbal(
  bool & full_bounded,
  bool & is_plain,
  size_t current_alignment);

}  // namespace typesupport_fastrtps_cpp

}  // namespace msg

}  // namespace gimbal_interface

#ifdef __cplusplus
extern "C"
{
#endif

ROSIDL_TYPESUPPORT_FASTRTPS_CPP_PUBLIC_gimbal_interface
const rosidl_message_type_support_t *
  ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME(rosidl_typesupport_fastrtps_cpp, gimbal_interface, msg, Gimbal)();

#ifdef __cplusplus
}
#endif

#endif  // GIMBAL_INTERFACE__MSG__DETAIL__GIMBAL__ROSIDL_TYPESUPPORT_FASTRTPS_CPP_HPP_
