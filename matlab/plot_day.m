%%��ʱ��Ϊ�����꣬����Ϊ�����꣬һ����ɫ����ĳһ�����ڼ�
%
 load('281_Dealtime.mat');                                                                                              %ѡ��281_Dealtime.mat��565_Dealtime.mat���ѡ��ͬ��·                                                                              
 s1 = Dealtime_281(1,:);                                                                                                 %ָ���һ����¼��������
 s1 = s1(5:8);                                                                                                                 %�ҵ���¼���º���
 data_plot = zeros(1,24);                                                                                                %��ʼ������
 figure;
 hold on;
 color = ['b','g','r','c','m','y','k'];                                                                                         %ÿ����ɫ����һ�����ڼ�
 color_index = 1;
 for i =1:length(Dealtimesum_281)                                                                                 %�������м�¼
     s2 =  Dealtime_281(i,:);                                                                                              %ָ��ڶ�����¼������
     s2 = s2(5:8);
     if ~strcmp(s1,s2) |i ==length(Dealtimesum_281)                                                        %�������Ȼ���ִ�е����һ����¼������������ռ�����һ��24Сʱ�����ݣ����仭����
         %d1 = str2num(s1(3));
         %d2 = str2num(s1(4));
         if mod(color_index,7) ==2
             plot([0:23],data_plot,color(mod(color_index,7)+1));                                                 %��ͼ
             if strcmp(s1,'0906')
                 plot([0:23],data_plot,'g');
             end
         end
             color_index = color_index+1;
             s1 = s2;                                                                                                                  %�ռ���һ��ļ�¼����ָ����һ����¼������         
             data_plot = zeros(1,24);                                                                                          %���³�ʼ������
     end
     T1 = str2num(Dealtime_281(i,9));                                                                                %�ҵ���ǰ�����µ�ʱ�䣬T1��ʾ��λʱ�䣬T2��ʾ��λʱ�䣬
     T2 = str2num(Dealtime_281(i,10));                                                                                                        
     data_plot(T1*10+T2+1) = Dealtimesum_281(i);                                                           %��+1����Ϊʱ�˼�У������ʹ��������Ѱַ����00-23ʱУ��Ϊ01-24ʱ������ǰʱ��ֵ�Ӽ�¼���ҵ�Ȼ��д��������
 end
 
 hold off; 