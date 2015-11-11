%%以天为横坐标，人数为纵坐标，每张图对应不同时刻
%
T1 = 0;                                                                                                                          %设置T1T2可调时刻
T2 = 8;
 load('281_Dealtime.mat');                                                                                              %选择281_Dealtime.mat或565_Dealtime.mat则可选不同线路
 time = cell2mat(Dealtime_281);                                                                                     %转换格式，将cell转为char格式
 tar = find(time(:,9)==num2str(T1) & time(:,10)==num2str(T2));                                      %找出所有T1T2时刻对应的记录
 tar =tar(4:7:end) ;                                                                                                            %找出星期n的所有记录（下标），8.1号为星期五，选择不同其实位置，则可选不同星期
 tar2 = Dealtimesum_281(tar);                                                                                           %通过下标找到数据
 %day = time(tar,[5:8]);
 %day = str2num(day(:,:));
 stem(1:length(tar2),tar2,'o')                                                                                              %画图
 title('00时每个日期一天总人数')