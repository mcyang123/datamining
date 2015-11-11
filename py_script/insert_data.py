# -*- coding: utf-8 -*-
"""
Created on Thu Nov 05 14:57:20 2015

@author: mc
"""
import string
import pymssql

class database_insert():
    def __init__(self):
        self.path = ''                   #数据文件路径
        self.host = 'localhost'          #数据库主机名
        self.uesr = 'sa'                 #用户名
        self.pwd = '121212.mc'           #密码
        self.db = ''                     #数据库名
        
    def connect(self):
        try:
            self.con = pymssql.connect(self.host,self.uesr,self.pwd,self.db,charset='utf8')   #连接数据库
            self.con.autocommit(True)                                                         #自动提交执行数据库语句
            self.cur = self.con.cursor()
            print 'connect successly'
        except:
            print 'connect error'
            
    def insert(self,procedure):                                                #参数为储存过程名称
        try:
            f = open(self.path,'r')
            flag=0
            for s in f:
                LIST =string.split(s,',')                                      #利用逗号分散数据
                LIST = ["'"+i.strip()+"'," for i in LIST]                      #为每个元素加上引号
                sql = ''
                sql = sql.join(LIST)                                           #将所有元素连接成字符串，以备储存语句调用执行
                sql = 'EXEC '+procedure+' '+sql[0:len(sql)-1]                  #合成sql语句
                sql = sql.encode('utf8')                                       #语句还有中文，一定要编码才能被数据库识别
                flag += 1                                                      #flag为插入出错时定位数据位置
                try:
                    self.cur.execute(sql)                                      #执行sql语句
                    print flag
                except:
                    print 'insert error'
                    print 'error in num:'+str(flag)
        except:
            print 'open file error'
        f.close()
        self.cur.close()
        self.con.close()
        print 'completed'
        
if __name__ == '__main__':
    
    #---------------插入train 表数据-----------------
    ins = database_insert()
    ins.path=r'D:\project\datamining\.txt'
    ins.db = 'gd_train_data'                                                   #数据库为gd_train_data
    ins.connect()
    ins.insert('INS_train')                                                    #储存过程名称为INS_train   
    raw_input('finlsh')
       
    '''--------------插入线路表数据-------------------'''
    
    