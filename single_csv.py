import os
import time
from itertools import zip_longest
import fnmatch
import datetime
from datetime import timedelta, datetime
import shutil
import time
import pandas as pd
from glob import glob
from sys import argv

for i in range(631):
    fln = "./probe_vgg16_features/probe_vgg16_features_%d" % i
    df = pd.read_csv(fln+".txt",delim_whitespace=True, header=None)
    df = df.transpose()
    df.to_csv(fln+".csv", header=False, index=False)
