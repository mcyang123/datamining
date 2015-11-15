function [ output] = separate( input_data,sep,flag )
%数据分离函数，将输入数据分按要求分成两部分
% 输入：input_data表示输入的数据，类型为结构，其中包含Date，Hour，total，week，weather
%输入sep,表示指定要分离出来的日期，格式为double，如801,1230等
%输入flag，标示位，1表示output输出分离日期的数据，0表示除去分离日期的数据，2表将seq的数据抽取出来，形成一个7*16大小的样本数组
%输出output，函数返回分离处理的数据,output的类型结构，格式和input_data一致

if flag ==1                                                                             %输出seq代表日期的数据
    for i = 1: length(sep)                                                          %找到所有与seq一致的数据，将其复制到output中
        date_index = find(input_data.Date ==sep(i));                 
        output.Date = input_data.Date(date_index);
        output.week = input_data.week(date_index);
        output.Hour = input_data.Hour(date_index);
        output.weather = input_data.weather(date_index);
        output.total = input_data.total(date_index);
    end
elseif flag ==0
    for i = 1: length(sep)
        date_index = find(input_data.Date ==sep(i));
        input_data.Date(date_index) = [];
        input_data.week(date_index) =[];
        input_data.Hour(date_index) = [];
        input_data.weather(date_index) = [];
        input_data.total(date_index) = [];
    end
    output = input_data;
elseif flag ==3
     if length(sep)~=7
         error('length of seq error!')
     end
     output =zeros(7,16);
     for i = 1: length(sep)          
        date_index = find(input_data.Date ==sep(i));
        if find(input_data.Hour<=21& input_data.Hour>=6)
            for j = 1:length(date_index)
                output( input_data.week(date_index(j)), input_data.Hour(date_index(j))-5) = input_data.total(date_index(j));
            end
        end
    end
else
    error('flag input error!')
end
end

