// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from gimbal_interface:msg/Gimbal.idl
// generated code does not contain a copyright notice

#ifndef GIMBAL_INTERFACE__MSG__DETAIL__GIMBAL__STRUCT_H_
#define GIMBAL_INTERFACE__MSG__DETAIL__GIMBAL__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

/// Struct defined in msg/Gimbal in the package gimbal_interface.
typedef struct gimbal_interface__msg__Gimbal
{
  double pan;
  double tilt;
} gimbal_interface__msg__Gimbal;

// Struct for a sequence of gimbal_interface__msg__Gimbal.
typedef struct gimbal_interface__msg__Gimbal__Sequence
{
  gimbal_interface__msg__Gimbal * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} gimbal_interface__msg__Gimbal__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // GIMBAL_INTERFACE__MSG__DETAIL__GIMBAL__STRUCT_H_
