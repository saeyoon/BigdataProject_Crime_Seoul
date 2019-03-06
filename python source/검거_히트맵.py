Python 3.7.2 (tags/v3.7.2:9a3ffc0492, Dec 23 2018, 22:20:52) [MSC v.1916 32 bit (Intel)] on win32
Type "help", "copyright", "credits" or "license()" for more information.
>>> import numpy as np
>>> import pandas as pd
>>> crime_anal = pd.read_excel('C:/SMWU_PY/2017_crime_final2.xlsx',index_col="자치구")
>>> crime_anal.head()
     발생합계  검거합계        살인        강도  ...   이혼      인구        범죄         검거
자치구                                  ...                                  
종로구  4057  4437  0.428571  0.473684  ...  265  164257  0.386277  99.618657
중구   4184  2851  0.000000  0.421053  ...  253  134593  0.305704  64.122479
용산구  4060  2936  0.000000  0.210526  ...  389  244444  0.271129  87.894267
성동구  2767  2031  0.000000  0.105263  ...  509  312711  0.089661  92.247281
광진구  4646  3289  0.357143  0.631579  ...  612  372298  0.453109  80.449525

[5 rows x 16 columns]
>>> target_col = ['강간검거율', '강도검거율', '살인검거율', '절도검거율', '폭력검거율', '검거']
>>> import seaborn as sns
>>> import platform
>>> from matplotlib import font_manager, rc
>>> path = "c:/Windows/Fonts/malgun.ttf"
>>> if platform.system() == 'Darwin':
    rc('font', family='AppleGothic')
elif platform.system() == 'Windows':
    font_name = font_manager.FontProperties(fname=path).get_name()
    rc('font', family=font_name)
else:
    print('Unknown system... sorry~~~~')

    
>>> crime_anal_sort = crime_anal.sort_values(by='검거', ascending=False)
>>> plt.figure(figsize = (10,10))
Traceback (most recent call last):
  File "<pyshell#12>", line 1, in <module>
    plt.figure(figsize = (10,10))
NameError: name 'plt' is not defined
>>> import matplotlib.pyplot as plt
>>> plt.figure(figsize = (10,10))
<Figure size 1000x1000 with 0 Axes>
>>> sns.heatmap(crime_anal_norm_sort[target_col], annot=True, fmt='f', 
                    linewidths=.5, cmap='RdPu')
Traceback (most recent call last):
  File "<pyshell#15>", line 1, in <module>
    sns.heatmap(crime_anal_norm_sort[target_col], annot=True, fmt='f',



NameError: name 'crime_anal_norm_sort' is not defined
>>> sns.heatmap(crime_anal_sort[target_col], annot=True, fmt='f', 
                    linewidths=.5, cmap='RdPu')
		
<matplotlib.axes._subplots.AxesSubplot object at 0x0B747C30>
>>> plt.title('범죄 검거 비율 (정규화된 검거의 합으로 정렬)')
		
Text(0.5, 1.0, '범죄 검거 비율 (정규화된 검거의 합으로 정렬)')
>>> plt.show()]



map_gum2 = folium.Map(location=[37.5502, 126.982], zoom_start=11,
                 tiles='Stamen Toner')
map_gum2.choropleth(geo_data = geo_str,
               data = crime_anal_norm['검거'],
               columns = [crime_anal_norm.index, crime_anal_norm['검거']],
               fill_color = 'PuRd', #PuRd, YlGnBu
               key_on = 'feature.id')
map_gum2









