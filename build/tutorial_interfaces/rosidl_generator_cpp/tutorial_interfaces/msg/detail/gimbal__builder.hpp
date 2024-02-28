// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from tutorial_interfaces:msg/Gimbal.idl
// generated code does not contain a copyright notice

#ifndef TUTORIAL_INTERFACES__MSG__DETAIL__GIMBAL__BUILDER_HPP_
#define TUTORIAL_INTERFACES__MSG__DETAIL__GIMBAL__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "tutorial_interfaces/msg/detail/gimbal__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace tutorial_interfaces
{

namespace msg
{

namespace builder
{

class Init_Gimbal_tilt
{
public:
  explicit Init_Gimbal_tilt(::tutorial_interfaces::msg::Gimbal & msg)
  : msg_(msg)
  {}
  ::tutorial_interfaces::msg::Gimbal tilt(::tutorial_interfaces::msg::Gimbal::_tilt_type arg)
  {
    msg_.tilt = std::move(arg);
    return std::move(msg_);
  }

private:
  ::tutorial_interfaces::msg::Gimbal msg_;
};

class Init_Gimbal_pan
{
public:
  Init_Gimbal_pan()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Gimbal_tilt pan(::tutorial_interfaces::msg::Gimbal::_pan_type arg)
  {
    msg_.pan = std::move(arg);
    return Init_Gimbal_tilt(msg_);
  }

private:
  ::tutorial_interfaces::msg::Gimbal msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::tutorial_interfaces::msg::Gimbal>()
{
  return tutorial_interfaces::msg::builder::Init_Gimbal_pan();
}

}  // namespace tutorial_interfaces

#endif  // TUTORIAL_INTERFACES__MSG__DETAIL__GIMBAL__BUILDER_HPP_
