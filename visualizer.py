#!/usr/bin/env python
#A bar plot showing benchmark of Hive(Map-reduce) Vs Hive (Apache-Tez)

import numpy as np
import matplotlib.pyplot as plt
import numpy.numarray as na
import sys 
import string 

from pylab import *

resultFile = open('hiveresults.txt','r')

counter = 0 
for line in resultFile:
    if   counter == 0:
         hive_time  = line[12:14]
         counter  = counter + 1
    elif counter == 1: 
         tez_time   = line[12:14] 

resultFile.close()

print hive_time
print tez_time

data1 = int(hive_time)
data2 = int(tez_time)

labels = ["Hive(Map-reduce)", "Hive(Apache-Tez)"]
data = [data1,data2]
error =  [0,0]

xlocations = na.array(range(len(data)))+0.5
width = 0.5
bar(xlocations,data,color='y',yerr=error, width=width)
#yticks(0,100,10)
#yticks(range(0, 100),10)
xticks(xlocations+ width/2, labels)
xlim(0, xlocations[-1]+width*2)
title("Hive Query Benchmark: Hive (Map-reduce) Vs Hive (Apache-Tez)")
gca().get_xaxis().tick_bottom()
gca().get_yaxis().tick_left()
ylabel('Query Time(seconds)')
show()

savefig("./plots/benchmark-Hive-Tez.png")
