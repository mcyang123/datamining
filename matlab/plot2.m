%%������Ϊʱ�̣�������Ϊ��������ĳ�����ڼ����߻���һ��

 load('281_data_y_m_d_h');                                                                                             %ѡ��281_Dealtime.mat��565_Dealtime.mat���ѡ��ͬ��· ��������     
 %------------------------------------------------------

 %-----------------------------------------------------
 
 
 x_axis = zeros(1,24);                                                                                                      %��ʼ�������������� 
 x_axis(:,:) = NaN;
 figure;
 hold on;
 index = find(week== 3) ;                                                                                               %�ҵ�ĳ�����ڼ����±꣬���ִ������ڼ�
 D1 = strcat(int2str(month(index(1))),int2str(day(index(1))));                                             %D1ָ���һ����¼�����ڣ�D2ָ��ǰ��¼���ڣ��Ա������Ƿ���ȣ�����ͬ���ڷ���һ��
 for i =1:length(index)                                                                                                    %�������м�¼
     D2 =  strcat(int2str(month(index(i))),int2str(day(index(i))));                                          %��¼��ǰ����
     if ~strcmp(D1,D2) | i ==length(index)                                                                        %ǰ���������ڲ�ͬ���������������Ϊͬһ���ڣ��Ѿ���¼��0-24Сʱ�����������Խ�ͼ�񻭳�
         D1 = D2;
         if strcmp(D2,'910')
            plot([0:23],x_axis,'r');
         else
            plot([0:23],x_axis,'o');
         end
         x_axis = zeros(1,24);
     end
     x_axis(hour(index(i))+1)=total(index(i)) ;                                                                      %��ǰ��������ͬ���������û��¼��0-23ʱ�������������ʱ�̼�¼����ֵ
 end
 hold off; 