function  output =add_tag( input,tag_day )
%对输入的结构增加一个标签对象
%输入input为结构类型，保存了原始数据，输入tag_day为要添加标签的日期，tag_day为数组，元素为double类型，标签值为0和1，
%其中0表示该日期状态正常（即非假期或没有调班），1表示该日期状态反转（即在星期一到五放假或周末要上班）
%输出为增加了标签的结构体数据

output = input;
output.tag = zeros(length(input.Date),1);                 %所有日期初始化默认tag为0
for i=1:length(tag_day) 
    index = find(input.Date == tag_day(i));            %找到第一个要加标签日期的下标
    output.tag(index) = 1;
end
end
