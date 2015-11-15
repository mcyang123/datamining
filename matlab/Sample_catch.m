function [ sample_data ] =Sample_catch( star_date,line_name)
%Sample_catch 获取7*24小时乘车人数样本矩阵
% 输入量star_date表示样本的起始日期，data为double类型 格式为：如81，line_name为线路名称，如281,565。函数将返回包括date在内的7天24小时的乘车人数，即7*24矩阵
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

