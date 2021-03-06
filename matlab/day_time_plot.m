%%以天为横坐标，人数为纵坐标，每张图对应不同时刻
%
 T1 = 0;                                                                                                                          %设置T1T2可调时刻
 T2 = 8;
 week = 7
 load('281_Dealtime.mat');                                                                                              %选择281_Dealtime.mat或565_Dealtime.mat则可选不同线路             
 tar = find(Dealtime_281(:,9)==num2str(T1) & Dealtime_281(:,10)==num2str(T2));         %找出所有T1T2时刻对应的记录
 if week~=10
     tar =tar(week:7:end) ;                                                                                                 %找出星期n的所有记录（下标），8.1号为星期五，选择不同其实位置，则可选不同星期
 end
 tar2 = Dealtimesum_281(tar);                                                                                           %通过下标找到数据
 stem(1:length(tar2),tar2,'o');                                                                                              %画图
 if week~=10
    title_name = strcat(num2str(T1),num2str(T2),'时各个星期',num2str(week),'人数分布');
 else
     title_name = strcat(num2str(T1),num2str(T2),'时各天人数分布');
 end
 title(title_name);
 