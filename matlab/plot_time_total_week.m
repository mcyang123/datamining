function [ ] = plot_time_total_week( input ,w)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%%横坐标为时刻，纵坐标为人数，将某个星期几的线画在一起 
 x_axis = zeros(1,16);                                                                                                      %初始化话横坐标数组 
 x_axis(:,:) = NaN;
 figure;
 hold on;
 index = find( input.week== w) ;                                                                                               %找到某个星期几的下标，数字代表星期几
 D1 =  input.Date(1);                                             %D1指向后一个记录的日期，D2指向当前记录日期，对比两者是否相等，将相同日期放在一起
 for i =1:length(index)                                                                                                    %遍历所有记录
     D2 =   input.Date(i);                                          %记录当前日期
     if D1~=D2 | i ==length(index)                                                                        %前后两个日期不同，则表明以上数据为同一日期，已经记录了0-24小时的人数，可以将图像画出
         D1 = D2;
         if D2==910
            plot([6:21],x_axis,'r');
         else
            plot([6:21],x_axis);
         end
         %x_axis = zeros(1,16);
         x_axis(:,:) = NaN;
     end
     x_axis( input.Hour(index(i))-5)= input.total(index(i)) ;                                                                      %若前后日期相同，这表明还没记录完0-23时的人数，则根据时刻记录人数值
 end
 hold off; 

end

