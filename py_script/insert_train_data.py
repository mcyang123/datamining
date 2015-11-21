# -*- coding: utf-8 -*-
"""
Created on Thu Nov 05 19:27:43 2015

@author: mc
"""

import insert_data 
ins = insert_data.database_insert()
ins.path=r'D:\project\datamining_of_tianchi_data\part1-data03\gd_train_data.txt'
ins.db = 'gd_train_data'                                                   #数据库为gd_train_data
ins.connect()
ins.insert('ins_train_1015')                                                    #储存过程名称 
raw_input('press to exit')

