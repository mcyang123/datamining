%%
%
 load('281_Dealtime.mat');                                                                                              %ѡ��281_Dealtime.mat��565_Dealtime.mat���ѡ��ͬ��·
 d1 = 0;                                                                                                                          %����T1T2�ɵ�ʱ��
 d2 = 8;
 plot_data = zeros(1,24);
 tar_index = find(Dealtime_281(:,7)==num2str(d1) & Dealtime_281(:,8)==num2str(d2));                                      %�ҳ�����d1d2ʱ�̶�Ӧ�ļ�¼
 for i = length(tar_index)
     day = Dealtime_281(tar_index);
     T1 = str2num(day(9));
     T2 = str2num(day(10));
     plot_data(T1*10+T2+1) = Dealtimesum_281(tar_index); 
 end
 plot([0:23],plot_data);
% title('00ʱÿ������һ��������')