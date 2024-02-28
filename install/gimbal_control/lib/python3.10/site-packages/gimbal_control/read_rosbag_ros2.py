# import bagpy
# from bagpy import bagreader


# from rosbags.rosbag2 import Reader
# from rosbags.serde import deserialize_cdr

import matplotlib.pyplot as plt
import pandas as pd

from rosbags.rosbag1 import Reader
from rosbags.serde import deserialize_cdr, ros1_to_cdr


# create reader instance
with Reader('./2023-12-11-21-11-58.bag') as reader:
    # topic and msgtype information is available on .connections list
    for connection in reader.connections:
        print(connection.topic, connection.msgtype)