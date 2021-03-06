%%以时间为横坐标，人数为纵坐标，一种颜色代表某一个星期几
%
 week  = 10                                                                                                                      %设置星期几
 load('281_Dealtime.mat');                                                                                              %选择281_Dealtime.mat或565_Dealtime.mat则可选不同线路                                                                              
 s1 = Dealtime_281(1,:);                                                                                                 %指向第一个记录的日期名
 s1 = s1(5:8);                                                                                                                 %找到记录的月和日
 data_plot = zeros(1,24);                                                                                                %初始化数组
 figure;
 hold on;
 color = ['b','g','r','c','m','y','k'];                                                                                         %每种颜色代表一个星期几
 color_index = 1;
 for i =1:length(Dealtimesum_281)                                                                                 %遍历所有记录
     s2 =  Dealtime_281(i,:);                                                                                              %指向第二个记录的日期
     s2 = s2(5:8);
     if ~strcmp(s1,s2) |i ==length(Dealtimesum_281)                                                        %如果不相等或者执行到最后一个记录则表明数组已收集到了一天24小时的数据，则将其画出来
         %d1 = str2num(s1(3));
         %d2 = str2num(s1(4));
         if week~=10                                                                                                         %是否按星期几分开
             if mod(color_index,7) ==week
                 plot([0:23],data_plot,color(mod(color_index,7)+1));                                         %画图
                 if strcmp(s1,'0906')
                     plot([0:23],data_plot,'g');
                 end
             end
         else                                                                                                                        %不分星期几，全部画出
             plot([0:23],data_plot,color(mod(color_index,7)+1));
         end
             color_index = color_index+1;
             s1 = s2;                                                                                                                  %收集完一天的记录后，是指向下一个记录的日期         
             data_plot = zeros(1,24);                                                                                          %重新初始化数组
     end
     T1 = str2num(Dealtime_281(i,9));                                                                                %找到当前日期下的时间，T1表示高位时间，T2表示低位时间，
     T2 = str2num(Dealtime_281(i,10));                                                                                                        
     data_plot(T1*10+T2+1) = Dealtimesum_281(i);                                                           %”+1“是为时了间校正，以使能在数组寻址，将00-23时校正为01-24时，将当前时刻值从记录中找到然后写入数组中
 end
 
 hold off; 