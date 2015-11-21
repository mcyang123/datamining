function dataout =train_function_single(datainput,d)
%%该函数用于对输入的数据进行训练，提取出一个值作为这批数据的一个代表值
%输入datainput为输入的一维数据，一般具有同一特性的一组数据，如某时刻某星期几的所有数据,d用于设置置信区间
%dataout  为输出的特征点。大小为1*1
    o = std(datainput);
    u = mean(datainput);
    index = find(datainput>u+d*o | datainput<u-d*o);
    datainput(index) = [];
    dataout  = sum(datainput)/length(datainput);
end
           
