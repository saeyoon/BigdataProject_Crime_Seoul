import numpy as np
import pandas as pd
from pandas import Series,DataFrame
import csv
from bs4 import BeautifulSoup
import os
from os import chdir
chdir('C:/SMWU_PY')
svg = open('middle.svg','r').read()
data = csv.reader(open('uheong.csv','r'),delimiter=",")
cctv = {}
result = []
min_value = 100; max_value = 0; past_header = False
for row in data :
    if not past_header:
        past_header = True
        continue

    try:
        unique = row[0]
        count = float(row[1].strip())
        cctv[unique] = count
        count_only.append(count)
    except:
        pass
    
    
soup = BeautifulSoup(svg,"lxml")
paths = soup.findAll('g')
colors = ["#F0F8FF","#FAEBD7","#FFEFDB","#EEDFCC","#CDC0B0","#8B8378","#333333"]
g_style = 'fill:'


for p in paths:
        try:
            count = cctv[p['id']]
        except:
            continue
        
        if count >= 55 :
            color_class = 6
        elif count >= 45:
            color_class = 5
        elif count >= 35:
            color_class = 4
        elif count >= 25:
            color_class = 3
        elif count >= 15:
            color_class = 2
        elif count >= 5:
            color_class = 1
        else :
            color_class = 0
            
        color = colors[color_class]
        p['style'] = g_style + color

print(soup.prettify())

