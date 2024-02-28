// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from gimbal_interface:msg/Gimbal.idl
// generated code does not contain a copyright notice

#ifndef GIMBAL_INTERFACE__MSG__DETAIL__GIMBAL__BUILDER_HPP_
#define GIMBAL_INTERFACE__MSG__DETAIL__GIMBAL__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "gimbal_interface/msg/detail/gimbal__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace gimbal_interface
{

namespace msg
{

namespace builder
{

class Init_Gimbal_tilt
{
public:
  explicit Init_Gimbal_tilt(::gimbal_interface::msg::Gimbal & msg)
  : msg_(msg)
  {}
  ::gimbal_interface::msg::Gimbal tilt(::gimbal_interface::msg::Gimbal::_tilt_type arg)
  {
    msg_.tilt = std::move(arg);
    return std::move(msg_);
  }

private:
  ::gimbal_interface::msg::Gimbal msg_;
};

class Init_Gimbal_pan
{
public:
  Init_Gimbal_pan()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_Gimbal_tilt pan(::gimbal_interface::msg::Gimbal::_pan_type arg)
  {
    msg_.pan = std::move(arg);
    return Init_Gimbal_tilt(msg_);
  }

private:
  ::gimbal_interface::msg::Gimbal msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::gimbal_interface::msg::Gimbal>()
{
  return gimbal_interface::msg::builder::Init_Gimbal_pan();
}

}  // namespace gimbal_interface

#endif  // GIMBAL_INTERFACE__MSG__DETAIL__GIMBAL__BUILDER_HPP_
