clear

% load the rosbag
bagname = '2023-12-11-21-11-58.bag';
rosbag('info',bagname)
bag = rosbag(bagname);

%% select the data topics from rosbag - 
bSel1 = select(bag,'Topic','/demo/gimbal_cmd');
ex_gimbal_cmd = readMessages(bSel1,'DataFormat','struct');

bSel2 = select(bag,'Topic','/utl/head_pan_cmd');
ex_head_pan_cmd = readMessages(bSel2,'DataFormat','struct');

bSel3 = select(bag,'Topic','/utl/head_tilt_cmd');
ex_head_tilt_cmd = readMessages(bSel3,'DataFormat','struct');

bpSel1 = select(bag,'Topic','/gimbal_driver/parameter_descriptions');
parameter_descriptions = readMessages(bpSel1,'DataFormat','struct');

bpSel2 = select(bag,'Topic','/gimbal_driver/parameter_updates');
parameter_updates = readMessages(bpSel2,'DataFormat','struct');


% clear bSel* bpSel* 
%% extract the timesteps for each of the topics from bag

msg_categories = string(unique(bag.MessageList{:,2}));
for i = 1:length(msg_categories)
    % for /demo/dimbal_cmd
    if strcmp(msg_categories{i}(2), 'd')
        temp_val = strcat(msg_categories{i}(7:end), '_time');
        eval(sprintf('%s = []',temp_val));
    % for utl/head_*    
    elseif strcmp(msg_categories{i}(2), 'u')
        temp_val = strcat(msg_categories{i}(6:end), '_time');
        eval(sprintf('%s = []',temp_val));
    % for gimbal_driver/parameter_*
%     elseif strcmp(msg_categories{g}(2), 'g')
%         temp_val = strcat(msg_categories{i}(15:end), '_time');
%         eval(sprintf('%s = []',temp_val));
    end
end

%% extract timesteps for topics of use
 
% for i = 1:size(bag.MessageList,1)
%     for j = 1:length(msg_categories)
%         if strcmp(string(bag.MessageList{i,2}), msg_categories{j})
% %             strcat(msg_categories{i}, '_time') = ...
%         end
%     end
% end

for i = 1:size(bag.MessageList,1)
    if strcmp(string(bag.MessageList{i,2}), msg_categories{1})
        gimbal_cmd_time = [gimbal_cmd_time; bag.MessageList{i,1}];
    elseif strcmp(string(bag.MessageList{i,2}), msg_categories{4})
        head_pan_cmd_time = [head_pan_cmd_time; bag.MessageList{i,1}];
    elseif strcmp(string(bag.MessageList{i,2}), msg_categories{5})
        head_tilt_cmd_time = [head_tilt_cmd_time; bag.MessageList{i,1}];
    end
end

%% extract the data values
for i = 1:length(ex_gimbal_cmd)
    gimbal_cmd(i,:) = ex_gimbal_cmd{i, 1}.Data'; % this includes 2d command regardng both pan and tilt
end

for i = 1:length(ex_head_tilt_cmd)
    head_tilt_cmd(i,:) = ex_head_tilt_cmd{i, 1}.Data;
end

for i = 1:length(ex_head_pan_cmd)
    head_pan_cmd(i,:) = ex_head_pan_cmd{i, 1}.Data;
end

% clear ex* bSel* bpSel* i
%% plot the command and execution out
close all

figure; plot(gimbal_cmd_time - gimbal_cmd_time(1), gimbal_cmd)
legend('gimbal command pan', 'gimbal command tilt')
xlabel('time (sec)')

figure; 
plot(head_pan_cmd_time - head_pan_cmd_time(1), head_pan_cmd)
hold on;
plot(head_tilt_cmd_time - head_tilt_cmd_time(1), head_tilt_cmd)
legend('head pan', 'head tilt')
xlabel('time (sec)')

% figure; 
% plot(head_pan_cmd_time - head_pan_cmd_time(1), head_pan_cmd - head_pan_cmd(1))
% hold on;
% plot(head_tilt_cmd_time - head_tilt_cmd_time(1), head_tilt_cmd - head_tilt_cmd(1))
% legend('head pan (sub)', 'head tilt (sub)')
