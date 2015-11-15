function [ output] = separate( input_data,sep,flag )
%���ݷ��뺯�������������ݷְ�Ҫ��ֳ�������
% ���룺input_data��ʾ��������ݣ�����Ϊ�ṹ�����а���Date��Hour��total��week��weather
%����sep,��ʾָ��Ҫ������������ڣ���ʽΪdouble����801,1230��
%����flag����ʾλ��1��ʾoutput����������ڵ����ݣ�0��ʾ��ȥ�������ڵ����ݣ�2��seq�����ݳ�ȡ�������γ�һ��7*16��С����������
%���output���������ط��봦�������,output�����ͽṹ����ʽ��input_dataһ��

if flag ==1                                                                             %���seq�������ڵ�����
    for i = 1: length(sep)                                                          %�ҵ�������seqһ�µ����ݣ����临�Ƶ�output��
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

