function  output =add_tag( input,tag_day )
%������Ľṹ����һ����ǩ����
%����inputΪ�ṹ���ͣ�������ԭʼ���ݣ�����tag_dayΪҪ��ӱ�ǩ�����ڣ�tag_dayΪ���飬Ԫ��Ϊdouble���ͣ���ǩֵΪ0��1��
%����0��ʾ������״̬���������Ǽ��ڻ�û�е��ࣩ��1��ʾ������״̬��ת����������һ����żٻ���ĩҪ�ϰࣩ
%���Ϊ�����˱�ǩ�Ľṹ������

output = input;
output.tag = zeros(length(input.Date),1);                 %�������ڳ�ʼ��Ĭ��tagΪ0
for i=1:length(tag_day) 
    index = find(input.Date == tag_day(i));            %�ҵ���һ��Ҫ�ӱ�ǩ���ڵ��±�
    output.tag(index) = 1;
end
end
