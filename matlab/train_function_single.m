function dataout =train_function_single(datainput)
%%�ú������ڶ���������ݽ���ѵ������ȡ��һ��ֵ��Ϊ�������ݵ�һ������ֵ
%����datainputΪ�����һά���ݣ�һ�����ͬһ���Ե�һ�����ݣ���ĳʱ��ĳ���ڼ�����������
%dataout  Ϊ����������㡣��СΪ1*1
    o = std(datainput);
    u = mean(datainput);
    index = find(datainput>u+3*o | datainput<u-3*o);
    datainput(index) = [];
    dataout  = sum(datainput)/length(datainput);
end
           
