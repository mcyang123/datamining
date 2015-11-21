function [ output ] = train_function_all( input,flag,fun)
%%将输入的所有数据训练成一个7*16的数组，以此作为估计值 时刻只算6-21时
%input为输入数据，类型为结构，包含Date、Hour、week、weather、total；output为输出数据，大小为7*24,函数默认调用train_function_single()为训练函数
%%
 if flag ==0                                                            %训练正常日期数据
     output = zeros(7,16);                                          %初始化数组
     for w = 1:7                                                         %遍历星期一到星期日
         for h  = 6:21                                                  %遍历6-21时
             h_i = find(input.Hour ==h);                        %找出第h时刻的数据下标
             w_i = find(input.week == w);                      %找出星期w的数据下标
             t_i = find(input.tag == 0);                          %找出正常状态的数据下标
             wh_i = intersect(w_i,h_i);   
             index = intersect(wh_i,t_i);                           %某星期几，某时刻下，正常状态的日期的数据
             datain = input.total(index);                          %找出所有星期w，h时刻正常状态的数据
             dataout = fun(datain);                                %训练单一维数据
             output(w,h-5) = dataout;                           %记录得到的星期w、h时刻的估计点
         end
     end
     
 elseif flag ==1                                                        %训练非正常日期
    output =zeros(2,16);
    %------------------------找到所有放假日期---------------------------------
    w_i = find(input.week ==6  | input.week ==7);     %找出周六日数据
    t_i = find(input.tag == 0);                                     %标签正常的数据
    wt_i1 = intersect(w_i,t_i);                                        %交集运算找出正常的周六日数据
    w_i = find(input.week >=1 & input.week <=5);     %找出反状态的周一到周五
    t_i = find(input.tag == 1);  
    wt_i2 = intersect(w_i,t_i);                                         %交集运算找出非正常的周一到周五数据
    wt_i = union(wt_i1,wt_i2);                                       %将正常的周六日和非正常的周一到周五数据合并
    for h = 6:21
        h_i = find(input.Hour == h);                              %将数据按时刻值分开
        index = intersect(h_i,wt_i);                                 %放假日期下，某时刻的数据的下标
        datain = input.total(index);                               %找到数据点
        dataout = fun(datain);                                      %训练数据
        output(1,h-5) = dataout;                                     %记录数据
    end

    %---------------------------------------------------------------------------
    
    %------------------------找到所有上班日期---------------------------------
    w_i = find(input.week ==6  | input.week ==7);     %找出周六日数据 
    t_i = find(input.tag == 1);                                      %标签非正常的数据
    wt_i1 = intersect(w_i,t_i);                                         %交集运算找出非正常的周六日数据（上班）
    w_i = find(input.week >=1 & input.week <=5);      %找出周一到周五数据
    t_i = find(input.tag == 0);  
    wt_i2 = intersect(w_i,t_i);                                         %找出正常状态的周一到周五
    wt_i = union(wt_i1,wt_i2);                                        %并集运算找出上班的日期数据
    for h = 6:21
        h_i = find(input.Hour == h);                               %将数据按时刻值分开
        index = intersect(h_i,wt_i);                                   %上班日期下，某时刻的数据的下标
        datain = input.total(index);                                 %找到数据点
        dataout = fun(datain);                                       %训练数据
        output(2,h-5) = dataout;                                     %记录数据
    end
    %------------------------------------------------------------------------------
 end
end

