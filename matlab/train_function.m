function dataout =train_function(datainput)
%%�ú������ڶ���������ݾ���ѵ������ȡ��һ��ֵ��Ϊ�������ݵ�һ������ֵ
%
    %dataout = mean(datainput);   %ƽ��ֵ��Ϊ����
    o = std(datainput)
    u = mean(datainput)
    index = find(datainput>u+3*o | datainput<u-3*o);
    datainput(index) = [];
    dataout  = sum(datainput)/length(datainput);
end
           
