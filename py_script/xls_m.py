# -*- coding: utf-8 -*-
"""
Created on Wed Nov 11 17:01:45 2015
合并sheet，重设id
@author: mc
"""
import xlrd
import xlwt
data_r = xlrd.open_workbook(r'D:\project\python\read_excel_modify_word\002.xls')
sheet_r = data_r.sheets()                                                              #读取所有的sheet 
wb = xlwt.Workbook()
sheet_w = wb.add_sheet('0')
index =0
for i in range(5):
    table = sheet_r[i]                                                               #获取所有的sheet，再逐一打开
    r =table.nrows    
    for j in range(r): 
        sheet_w.write(index,0,index+1)    #id
        sheet_w.write(index,1,table.cell(j,2).value)     #单词
        sheet_w.write(index,2,table.cell(j,4).value)     #音标
        sheet_w.write(index,3,table.cell(j,8).value)     #例句
        sheet_w.write(index,4,table.cell(j,3).value)     #词义
        sheet_w.write(index,5,table.cell(j,1).value)     #level
        index +=1

wb.save(r'D:\project\python\read_excel_modify_word\xlllll.xls')
        
