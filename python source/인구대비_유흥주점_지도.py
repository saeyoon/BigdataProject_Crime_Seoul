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
>>> data = csv.reader(open('ratio_alcohol.csv','r'),delimiter=",")
>>> alcohol = {}
>>> result = []
>>> 
>>> 
>>> for row in data:
	district = row[0]
	count = float(row[1].strip())
	alcohol[district] = count
	result.append(alcohol)

	
>>> soup = BeautifulSoup(svg,'lxml')
>>> paths = soup.findAll('path')
>>> colors = ["#c4e6ff","#006BB2","#003D66"]
>>> 
>>> colors = ["#c4e6ff","#7fbde8","#006BB2","#003D66"]
>>> for p in paths:
	if p['id']:
		count = alcohol[p['id']]
		if count >= 50 :
			color_class = 3
		elif count >= 30:
			color_class = 2
		elif count >= 10:
			color_class = 1
		else:
			color_class = 0
		color = colors[color_class]
		p['style'] = path_style + color

		
Traceback (most recent call last):
  File "<pyshell#25>", line 13, in <module>
    p['style'] = path_style + color
NameError: name 'path_style' is not defined
>>> path_style = 'fill:'
>>> 
>>> print(soup.prettify())


>>> print(soup.prettify())

>>> 
>>> for p in paths:
	if p['id']:
		count = alcohol[p['id']]
		if count >= 50 :
			color_class = 3
		elif count >= 30:
			color_class = 2
		elif count >= 10:
			color_class = 1
				else:
			color_class = 0
		color = colors[color_class]
		p['style'] = path_style + color
		
SyntaxError: unexpected indent
>>> for p in paths:
	if p['id']:
		count = alcohol[p['id']]
		if count >= 50 :
			color_class = 3
		elif count >= 30:
			color_class = 2
		elif count >= 10:
			color_class = 1
		else:
			color_class = 0
		color = colors[color_class]
		p['style'] = path_style + color

		
>>> print(soup.prettify())


>>> colors = ["#630630","#7fbde8","#006BB2","#003D66"]
>>> 
>>> print(soup.prettify())

>>> for p in paths:
	if p['id']:
		count = alcohol[p['id']]
		if count >= 50 :
			color_class = 3
		elif count >= 30:
			color_class = 2
		elif count >= 10:
			color_class = 1
		else:
			color_class = 0
		color = colors[color_class]
		p['style'] = path_style + color

		
>>> print(soup.prettify())


>>> colors = ["#c4e6ff","#7fbde8","#006BB2","#003D66"]
KeyboardInterrupt
>>> colors = ["#c4e6ff","#7fbde8","#006BB2","#7a0410"]
>>> for p in paths:
	if p['id']:
		count = alcohol[p['id']]
		if count >= 50 :
			color_class = 3
		elif count >= 30:
			color_class = 2
		elif count >= 10:
			color_class = 1
		else:
			color_class = 0
		color = colors[color_class]
		p['style'] = path_style + color

		
>>> print(soup.prettify())


>>> colors = ["#c4e6ff","#7fbde8","#006BB2","#002138"]
>>> for p in paths:
	if p['id']:
		count = alcohol[p['id']]
		if count >= 50 :
			color_class = 3
		elif count >= 30:
			color_class = 2
		elif count >= 10:
			color_class = 1
		else:
			color_class = 0
		color = colors[color_class]
		p['style'] = path_style + colo

		
Traceback (most recent call last):
  File "<pyshell#51>", line 13, in <module>
    p['style'] = path_style + colo
NameError: name 'colo' is not defined
>>> for p in paths:
	if p['id']:
		count = alcohol[p['id']]
		if count >= 50 :
			color_class = 3
		elif count >= 30:
			color_class = 2
		elif count >= 10:
			color_class = 1
		else:
			color_class = 0
		color = colors[color_class]
		p['style'] = path_style + color

		
>>> print(soup.prettify())


>>> 
