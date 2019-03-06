Python 3.7.2 (tags/v3.7.2:9a3ffc0492, Dec 23 2018, 22:20:52) [MSC v.1916 32 bit (Intel)] on win32
Type "help", "copyright", "credits" or "license()" for more information.
>>> import numpy as np
>>> import pandas as pd
>>> from pandas import Series,DataFrame
>>> import csv
>>> from bs4 import BeautifulSoup
>>> import os
>>> from os import chdir
>>> chdir('C:/SMWU_PY')
>>> svg = open('Seoul_map.svg','r').read()
>>> data = csv.reader(open('ratio_crime.csv','r'),delimiter=",")
>>> crime = {}
>>> result = []
>>> for row in data:
	district = row[0]
	count = float(row[1].strip())
	crime[district] = count
	result.append(crime)

	
>>> soup = BeautifulSoup(svg,'lxml')
>>> paths = soup.findAll('path')
>>> path_style = 'fill:'
>>> colors = ["#eae0d5","#Ebd5bd","#705e56","#272425"]
>>> for p in paths:
	if p['id']:
		count = crime[p['id']]
		if count >= 1500 :
			color_class = 3
		elif count >= 1200:
			color_class = 2
		elif count >= 900:
			color_class = 1
		else:
			color_class = 0
		color = colors[color_class]
		p['style'] = path_style + color

		
>>> print(soup.prettify())


>>> 
