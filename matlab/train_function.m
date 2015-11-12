function dataout =train_function(datainput)
%%该函数用于对输入的数据就行训练，提取出一个值作为这批数据的一个代表值
%
    %dataout = mean(datainput);   %平均值作为估计
    o = std(datainput)
    u = mean(datainput)
    index = find(datainput>u+3*o | datainput<u-3*o);
    datainput(index) = [];
    dataout  = sum(datainput)/length(datainput);
end
           
