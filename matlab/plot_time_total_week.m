function [ ] = plot_time_total_week( input ,w)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%%������Ϊʱ�̣�������Ϊ��������ĳ�����ڼ����߻���һ�� 
 x_axis = zeros(1,16);                                                                                                      %��ʼ�������������� 
 x_axis(:,:) = NaN;
 figure;
 hold on;
 index = find( input.week== w) ;                                                                                               %�ҵ�ĳ�����ڼ����±꣬���ִ������ڼ�
 D1 =  input.Date(1);                                             %D1ָ���һ����¼�����ڣ�D2ָ��ǰ��¼���ڣ��Ա������Ƿ���ȣ�����ͬ���ڷ���һ��
 for i =1:length(index)                                                                                                    %�������м�¼
     D2 =   input.Date(i);                                          %��¼��ǰ����
     if D1~=D2 | i ==length(index)                                                                        %ǰ���������ڲ�ͬ���������������Ϊͬһ���ڣ��Ѿ���¼��0-24Сʱ�����������Խ�ͼ�񻭳�
         D1 = D2;
         if D2==910
            plot([6:21],x_axis,'r');
         else
            plot([6:21],x_axis);
         end
         %x_axis = zeros(1,16);
         x_axis(:,:) = NaN;
     end
     x_axis( input.Hour(index(i))-5)= input.total(index(i)) ;                                                                      %��ǰ��������ͬ���������û��¼��0-23ʱ�������������ʱ�̼�¼����ֵ
 end
 hold off; 

end

