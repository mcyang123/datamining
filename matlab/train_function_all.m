function [ output ] = train_function_all( input )
%%将输入的所有数据训练成一个7*16的数组，以此作为估计值 时刻只算6-21时
%input为输入数据，类型为结构，包含Date、Hour、week、weather、total；output为输出数据，大小为7*24,函数默认调用train_function_single()为训练函数
%%
 
 output = zeros(7,16);                                          %初始化数组
 for w = 1:7                                                         %遍历星期一到星期日
     for h  = 6:21                                                  %遍历6-21时
         h_i = find(input.Hour ==h);                        %找出第h时刻的数据下标
         w_i = find(input.week == w);                      %找出星期w的数据下标
         T_index = ismember(h_i,w_i);                       %匹配两个下标列表，T_index为h_i的下标，
         index = h_i(T_index);                                   %通过h_i找到真正数据的下标
         datain = input.total(index);                          %找出所有星期w，h时刻的数据
         dataout = train_function_single(datain);      %训练单一维数据
         output(w,h-5) = dataout;                           %记录得到的星期w、h时刻的估计点
     end
 end
end

