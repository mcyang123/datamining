# -*- coding: utf-8 -*-
"""
Created on Tue Nov 10 08:11:16 2015

@author: mc
"""
import xlwt
f_d = open(r'D:\project\datamining\data\281_Dealtime.csv')
f_w = open(r'D:\project\datamining\data\weather.csv')
temp = f_w.read()
L = temp.split('\n')
L[0] = L[0][3:len(L[0])]
print L[0]
day_old='01'
j = 1
workbook = xlwt.Workbook()
sheet = workbook.add_sheet('0')
for i,s in enumerate(f_d):
    [time,num]=s.split('\t',1)
    num = num.rstrip()
    years = time[0:4]
    month = time[4:6]
    day = time[6:8]
    hour = time[8:10]
    for k in range(len(L)-1):
        if month+day==L[k][4:8]:
            if '08'<=hour<='20':    #白天
                weather = L[k][-2]
            else:
                weather = L[k][-1]    
    if day_old!=day:
        j += 1
        day_old = day
    w = j-int(j/7)*7
    if w == 0:   #i==0 或i为7的倍数,星期五
        week = '4'
    elif w == 1:   #余1，星期六
        week = '5'
    elif w == 2:   #余2，星期日
        week = '6'
    elif w == 3:   #余3，星期一
        week = '7'
    elif w == 4:   #余4，星期二
        week = '1'
    elif w == 5:   #余5，星期三
        week = '2'
    elif w == 6:   #余6，星期四
        week = '3'
    sheet.write(i,0,int(years))
    sheet.write(i,1,int(month))
    sheet.write(i,2,int(day))
    sheet.write(i,3,int(hour))
    sheet.write(i,4,int(week))
    sheet.write(i,5,int(weather))
    sheet.write(i,6,int(num))
    
f_d.close()
f_w.close()
workbook.save(r'D:\project\datamining\data\year_month_day_hour_week_total.xls')



