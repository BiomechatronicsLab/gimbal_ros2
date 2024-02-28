// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from tutorial_interfaces:msg/Gimbal.idl
// generated code does not contain a copyright notice

#ifndef TUTORIAL_INTERFACES__MSG__DETAIL__GIMBAL__STRUCT_H_
#define TUTORIAL_INTERFACES__MSG__DETAIL__GIMBAL__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

/// Struct defined in msg/Gimbal in the package tutorial_interfaces.
typedef struct tutorial_interfaces__msg__Gimbal
{
  double pan;
  double tilt;
} tutorial_interfaces__msg__Gimbal;

// Struct for a sequence of tutorial_interfaces__msg__Gimbal.
typedef struct tutorial_interfaces__msg__Gimbal__Sequence
{
  tutorial_interfaces__msg__Gimbal * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} tutorial_interfaces__msg__Gimbal__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // TUTORIAL_INTERFACES__MSG__DETAIL__GIMBAL__STRUCT_H_
