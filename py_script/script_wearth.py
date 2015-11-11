# -*- coding: utf-8 -*-
"""
Created on Thu Nov 05 20:47:20 2015
整理天气表的数据，包括统一日期格式，对天气分级
@author: mc
"""
import string
import re
import pymssql
con = pymssql.connect('localhost','sa','121212.mc','gd_train_data',charset='utf8')       #连接数据库
con.autocommit(True)                                                                 #自动提交执行数据库语句
cur = con.cursor()
f = open(r'D:\project\datamining\005.txt','r')
for s in f:
    LIST = string.split(s,',')
    
    time = string.split(LIST[0],r'/')
    for i in [1,2]:
        if len(time[i])==1:
            time[i] = '0'+time[i]
    time[i] = time[i]+'00'
    Data_time = ''
    Data_time = Data_time.join(time)
    
    wearth = []
    w = string.split(LIST[1],r'/')
    for i in [0,1]:
        w[i] = w[i].encode('utf8')
        if '晴' in w[i] :
            wearth += '1'
        elif '多云' in w[i] or '阴'in w[i] or '霾'in w[i]:
            wearth += '2'
        elif '小雨' in w[i] or '中雨'in w[i] or '阵雨'in w[i] :
            wearth += '3'
        elif '暴雨' in w[i] or '大雨'in w[i] :
            wearth += '4'
    w=''
    wearth = w.join(wearth)
    
    Temperature = []
    T = string.split(LIST[2],r'/')
    for i in [0,1]:
        if len(T[i])==3:
            Temperature += '0'
        Temperature += T[i][0:-2]
    T = ''
    Temperature = T.join(Temperature)
    
    wind = ''
    W = string.split(LIST[3],r'/')
    for i in [0,1]:
        W[i] = W[i].encode('utf8')
        wind += W[i][W[i].find('级')-1]
        
    Data_time = "'"+Data_time+"',"
    wearth = "'"+wearth+"',"
    Temperature = "'"+Temperature+"',"
    wind = "'"+wind+"'"
    sql = 'EXEC '+'INS_weather '+Data_time+wearth+Temperature+wind
    #print sql
    cur.execute(sql)

f.close()
cur.close()
con.close()
raw_input('sssss')

        
        