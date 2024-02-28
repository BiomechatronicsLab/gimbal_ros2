// generated from rosidl_generator_cpp/resource/idl__struct.hpp.em
// with input from gimbal_interfaces:msg/Gimbal.idl
// generated code does not contain a copyright notice

#ifndef GIMBAL_INTERFACES__MSG__DETAIL__GIMBAL__STRUCT_HPP_
#define GIMBAL_INTERFACES__MSG__DETAIL__GIMBAL__STRUCT_HPP_

#include <algorithm>
#include <array>
#include <memory>
#include <string>
#include <vector>

#include "rosidl_runtime_cpp/bounded_vector.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


#ifndef _WIN32
# define DEPRECATED__gimbal_interfaces__msg__Gimbal __attribute__((deprecated))
#else
# define DEPRECATED__gimbal_interfaces__msg__Gimbal __declspec(deprecated)
#endif

namespace gimbal_interfaces
{

namespace msg
{

// message struct
template<class ContainerAllocator>
struct Gimbal_
{
  using Type = Gimbal_<ContainerAllocator>;

  explicit Gimbal_(rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->pan = 0.0;
      this->tilt = 0.0;
    }
  }

  explicit Gimbal_(const ContainerAllocator & _alloc, rosidl_runtime_cpp::MessageInitialization _init = rosidl_runtime_cpp::MessageInitialization::ALL)
  {
    (void)_alloc;
    if (rosidl_runtime_cpp::MessageInitialization::ALL == _init ||
      rosidl_runtime_cpp::MessageInitialization::ZERO == _init)
    {
      this->pan = 0.0;
      this->tilt = 0.0;
    }
  }

  // field types and members
  using _pan_type =
    double;
  _pan_type pan;
  using _tilt_type =
    double;
  _tilt_type tilt;

  // setters for named parameter idiom
  Type & set__pan(
    const double & _arg)
  {
    this->pan = _arg;
    return *this;
  }
  Type & set__tilt(
    const double & _arg)
  {
    this->tilt = _arg;
    return *this;
  }

  // constant declarations

  // pointer types
  using RawPtr =
    gimbal_interfaces::msg::Gimbal_<ContainerAllocator> *;
  using ConstRawPtr =
    const gimbal_interfaces::msg::Gimbal_<ContainerAllocator> *;
  using SharedPtr =
    std::shared_ptr<gimbal_interfaces::msg::Gimbal_<ContainerAllocator>>;
  using ConstSharedPtr =
    std::shared_ptr<gimbal_interfaces::msg::Gimbal_<ContainerAllocator> const>;

  template<typename Deleter = std::default_delete<
      gimbal_interfaces::msg::Gimbal_<ContainerAllocator>>>
  using UniquePtrWithDeleter =
    std::unique_ptr<gimbal_interfaces::msg::Gimbal_<ContainerAllocator>, Deleter>;

  using UniquePtr = UniquePtrWithDeleter<>;

  template<typename Deleter = std::default_delete<
      gimbal_interfaces::msg::Gimbal_<ContainerAllocator>>>
  using ConstUniquePtrWithDeleter =
    std::unique_ptr<gimbal_interfaces::msg::Gimbal_<ContainerAllocator> const, Deleter>;
  using ConstUniquePtr = ConstUniquePtrWithDeleter<>;

  using WeakPtr =
    std::weak_ptr<gimbal_interfaces::msg::Gimbal_<ContainerAllocator>>;
  using ConstWeakPtr =
    std::weak_ptr<gimbal_interfaces::msg::Gimbal_<ContainerAllocator> const>;

  // pointer types similar to ROS 1, use SharedPtr / ConstSharedPtr instead
  // NOTE: Can't use 'using' here because GNU C++ can't parse attributes properly
  typedef DEPRECATED__gimbal_interfaces__msg__Gimbal
    std::shared_ptr<gimbal_interfaces::msg::Gimbal_<ContainerAllocator>>
    Ptr;
  typedef DEPRECATED__gimbal_interfaces__msg__Gimbal
    std::shared_ptr<gimbal_interfaces::msg::Gimbal_<ContainerAllocator> const>
    ConstPtr;

  // comparison operators
  bool operator==(const Gimbal_ & other) const
  {
    if (this->pan != other.pan) {
      return false;
    }
    if (this->tilt != other.tilt) {
      return false;
    }
    return true;
  }
  bool operator!=(const Gimbal_ & other) const
  {
    return !this->operator==(other);
  }
};  // struct Gimbal_

// alias to use template instance with default allocator
using Gimbal =
  gimbal_interfaces::msg::Gimbal_<std::allocator<void>>;

// constant definitions

}  // namespace msg

}  // namespace gimbal_interfaces

#endif  // GIMBAL_INTERFACES__MSG__DETAIL__GIMBAL__STRUCT_HPP_
