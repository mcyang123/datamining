%%
%
 load('281_Dealtime.mat');                                                                                              %选择281_Dealtime.mat或565_Dealtime.mat则可选不同线路
 d1 = 0;                                                                                                                          %设置T1T2可调时刻
 d2 = 8;
 plot_data = zeros(1,24);
 tar_index = find(Dealtime_281(:,7)==num2str(d1) & Dealtime_281(:,8)==num2str(d2));                                      %找出所有d1d2时刻对应的记录
 for i = length(tar_index)
     day = Dealtime_281(tar_index);
     T1 = str2num(day(9));
     T2 = str2num(day(10));
     plot_data(T1*10+T2+1) = Dealtimesum_281(tar_index); 
 end
 plot([0:23],plot_data);
% title('00时每个日期一天总人数')