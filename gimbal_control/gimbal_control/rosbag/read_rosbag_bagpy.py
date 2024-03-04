import bagpy
from bagpy import bagreader

import matplotlib.pyplot as plt
import pandas as pd

b = bagreader('2023-12-11-21-11-58.bag')

# get the list of topics
print("b.topic_table =\n",  b.topic_table)
print("b.__dir__() =\n", b.__dir__())
print("/demo/gimbal_cmd =\n",  b.message_by_topic('/demo/gimbal_cmd'))
print(b.message_by_topic('/utl/head_pan_cmd'))
print(b.message_by_topic('/utl/head_tilt_cmd'))


# get all the messages of type velocity
std_msgs   = b.std_data()
print("std_msgs = ", std_msgs)


# datadf = pd.read_csv(std_msgs[0])
datadf = pd.read_csv(b.message_by_topic('/demo/gimbal_cmd'))

print("datadf =\n", datadf)

print("datadf['data_1'] =\n", datadf['data_1'])
# plt.plot(datadf['Time'])

# plt.plot(datadf['Time'] - datadf['Time'][0], datadf['data_0'])
# plt.show()

# plt.plot(datadf['Time'] - datadf['Time'][0], datadf['data_1'])
# plt.show()

csvfiles = []
for i in b.topics:
    data = b.message_by_topic(i)
    csvfiles.append(data)

# print("csvfiles = ", csvfiles)

print(csvfiles[0])
gimbal_cmd_data = pd.read_csv(csvfiles[0])
print("data =\b", gimbal_cmd_data)

print("gimbal_pan =\n", gimbal_cmd_data['data_0'])
print("gimbal_tilte =\n", gimbal_cmd_data['data_1'])


# # quickly plot velocities
# b.plot_vel(save_fig=True)

# you can animate a timeseries data
# bagpy.animate_timeseries(datadf['Time'], datadf['data_1'], title='Timeseries Plot')
# bagpy.animate_timeseries(datadf['Time'], datadf['data_1'], title='Timeseries Plot')

