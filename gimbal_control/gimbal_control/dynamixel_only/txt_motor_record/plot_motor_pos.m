clear

motor_b_pos_mode = importdata('pos_mode_bottom.txt') ;
motor_u_pos_mode = importdata('pos_mode_up.txt') ;
motor_b_vel_mode = importdata('vel_mode_bottom.txt') ;
motor_u_vel_mode = importdata('vel_mode_up.txt') ;


figure; plot(diff(motor_b_pos_mode)); hold on; plot(diff(motor_b_vel_mode))