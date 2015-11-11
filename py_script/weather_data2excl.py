# -*- coding: utf-8 -*-
"""
Created on Tue Nov 10 09:41:44 2015

@author: mc
"""
import xlutils.copy as copy
import xlrd
f = open(r'D:\project\datamining\data\weather.csv')
for s in f:
    [time,weather]=s.split('\t',1)
    weather = weather.rstrip()
    
    