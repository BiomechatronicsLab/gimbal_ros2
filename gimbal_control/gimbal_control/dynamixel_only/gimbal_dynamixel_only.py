from dynio import * # https://pypi.org/project/dynamixel-controller/
import time
# import rospy
import csv

dxl_io = dxl.DynamixelIO(device_name='/dev/tty.usbserial-FT6Z5UZP', baud_rate=57600) # your port for U2D2 or other serial device

motor_bottom = dxl_io.new_mx64(dxl_id=0, protocol=2)   
motor_top = dxl_io.new_mx64(dxl_id=1, protocol=2)

ifRecordPos = False
# ifRecordVel = True



# speed = motor.read_control_table("Present_Speed") # Returns present velocity
# current = motor.get_current()

# use position mode to directly move from current pos to target (no interpolation)

# motor_bottom.torque_disable() # you have to disable torque before you change modes
# motor_bottom.set_position_mode()
# motor_bottom.torque_enable() 

# motor_top.torque_disable() # you have to disable torque before you change modes
# motor_top.set_position_mode()
# motor_top.torque_enable() 

# motor_bottom.set_position(1200)
# motor_top.set_position(3000)
# for _ in range(20):
#     position_bottom = motor_bottom.get_position()
#     position_top = motor_top.get_position()
#     print("position_bottom = ", position_bottom, ", position_top = ", position_top)

# print('session 1 (position) finished')

# motor_bottom.set_position(60)
# motor_top.set_position(2000)
# for _ in range(20):
#     position_bottom = motor_bottom.get_position()
#     position_top = motor_top.get_position()
#     print("position_bottom = ", position_bottom, ", position_top = ", position_top)

# print('session 2 (position) finished')


# set motor positon with intepolation in position mode
motor_bottom.torque_disable() # you have to disable torque before you change modes
motor_bottom.set_position_mode()
motor_bottom.torque_enable() 

motor_top.torque_disable() # you have to disable torque before you change modes
motor_top.set_position_mode()
motor_top.torque_enable() 

initial_bottom = motor_bottom.get_position()
initial_top = motor_top.get_position()
print("initial_bottom = ", initial_bottom, ", initial_top = ", initial_top)

pos_top_out = []
pos_bottom_out = []

for time_step in range(20):
    # print(time_step)
    position_bottom = initial_bottom + (1200 - initial_bottom)/20 * (time_step + 1)
    position_top = initial_top + (3000 - initial_top)/20 * (time_step + 1)

    motor_bottom.set_position(int(position_bottom))
    motor_top.set_position(int(position_top))

    pos_top_out.append(motor_top.get_position())
    pos_bottom_out.append(motor_bottom.get_position())

    current_top = motor_top.get_current()
    current_bottom = motor_bottom.get_current()

    # print("pos_bottom = ", motor_bottom.get_position(), ", pos_top = ", motor_top.get_position())
    print("pos_bottom = ", motor_bottom.get_position(), ", pos_top = ", motor_top.get_position(), ", current_bottom = ", current_bottom, ", current_top = ", current_top)

print('session 1 (position) finished')


initial_bottom = motor_bottom.get_position()
initial_top = motor_top.get_position()
print("initial_bottom = ", initial_bottom, ", initial_top = ", initial_top)


for time_step in range(20):
    # print(time_step)
    position_bottom = initial_bottom + (0 - initial_bottom)/20 * (time_step + 1)
    position_top = initial_top + (2000 - initial_top)/20 * (time_step + 1)

    motor_bottom.set_position(int(position_bottom))
    motor_top.set_position(int(position_top))

    pos_top_out.append(motor_top.get_position())
    pos_bottom_out.append(motor_bottom.get_position())

    current_top = motor_top.get_current()
    current_bottom = motor_bottom.get_current()

    # print("pos_bottom = ", motor_bottom.get_position(), ", pos_top = ", motor_top.get_position())
    print("pos_bottom = ", motor_bottom.get_position(), ", pos_top = ", motor_top.get_position(), ", current_bottom = ", current_bottom, ", current_top = ", current_top)


print('session 2 (position) finished')


# if ifRecordPos:
#     with open("pos_mode_top.txt", "a") as f:
#         for key in pos_top_out:
#             f.write(str(key) + "\n")

#     with open("pos_mode_bottom.txt", "a") as f:
#         for key in pos_bottom_out:
#             f.write(str(key) + "\n")

if ifRecordPos:
    with open("motorPos_modePos.txt", "a") as f:
        writer = csv.writer(f, delimiter='\t')
        writer.writerows(zip(pos_bottom_out, pos_top_out))


# one method is velocity mode
motor_bottom.torque_disable()
motor_bottom.set_velocity_mode()
motor_bottom.torque_enable()

motor_top.torque_disable()
motor_top.set_velocity_mode()
motor_top.torque_enable()

pos_top_out = []
pos_bottom_out = []

motor_bottom.set_velocity(25)
motor_top.set_velocity(25)
for _ in range(20):
    current_top = motor_top.get_current()
    current_bottom = motor_bottom.get_current()
    # time.sleep(0.1)

    pos_top_out.append(motor_top.get_position())
    pos_bottom_out.append(motor_bottom.get_position())

    # print("pos_bottom = ", motor_bottom.get_position(), ", pos_top = ", motor_top.get_position())
    print("pos_bottom = ", motor_bottom.get_position(), ", pos_top = ", motor_top.get_position(), ", current_bottom = ", current_bottom, ", current_top = ", current_top)

print('session 1 (velocity) finished')


motor_bottom.set_velocity(-25)
motor_top.set_velocity(-25)
for _ in range(20):
    # print("pos_bottom = ", motor_bottom.get_position(), ", pos_top = ", motor_top.get_position())
    # time.sleep(0.1)

    current_top = motor_top.get_current()
    current_bottom = motor_bottom.get_current()

    pos_top_out.append(motor_top.get_position())
    pos_bottom_out.append(motor_bottom.get_position())

    print("pos_bottom = ", motor_bottom.get_position(), ", pos_top = ", motor_top.get_position(), ", current_bottom = ", current_bottom, ", current_top = ", current_top)


print('session 2 (velocity) finished')

# if ifRecordPos:
#     with open("vel_mode_top.txt", "a") as f:
#         for key in pos_top_out:
#             f.write(str(key) + "\n")

#     with open("vel_mode_bottom.txt", "a") as f:
#         for key in pos_bottom_out:
#             f.write(str(key) + "\n")

if ifRecordPos:
    with open("motorPos_modeVel.txt", "a") as f:
        writer = csv.writer(f, delimiter='\t')
        writer.writerows(zip(pos_bottom_out, pos_top_out))

motor_bottom.set_velocity(0)
motor_bottom.torque_disable()

motor_top.set_velocity(0)
motor_top.torque_disable()







