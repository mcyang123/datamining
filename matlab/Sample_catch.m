function [ sample_data ] =Sample_catch( star_date,line_name)
%Sample_catch ��ȡ7*24Сʱ�˳�������������
% ������star_date��ʾ��������ʼ���ڣ�dataΪdouble���� ��ʽΪ����81��line_nameΪ��·���ƣ���281,565�����������ذ���date���ڵ�7��24Сʱ�ĳ˳���������7*24����
if strcmp(line_name,'281')
     load('281_data_y_m_d_h.mat'); 
elseif strcmp(line_name,'565')
     load('281_data_y_m_d_h.mat'); 
else
    error('please input correct Line_name ')
end
load('daylist.mat');
sample_data = zeros(7,24);
star_index = find(star_date==daylist);
sample_date_index = star_index:star_index+6;
sample_date = daylist(sample_date_index);
for i = 1:length(sample_date)
    date_index = find(Date == sample_date(i));
    %week(date_index);
    %Hour(date_index)+1
    for j =1:length(date_index)
        sample_data(week(date_index(j)),Hour(date_index(j))+1) = total(date_index(j));
    end
end

