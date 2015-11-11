 %%脚本用于训练样本值，以期得到一个针对星期和时刻的估计值
 
 
load('281_Dealtime.mat');                                                                                              %选择281_Dealtime.mat或565_Dealtime.mat则可选不同线路
time = cell2mat(Dealtime_281);                                                                                    %转换格式，将cell转为char格式
train_vaule = zeros(24,7);
for T1 = 0:2                                                                                                                 %设置T1T2可调时刻       
    for T2 = 0:9
        if T1*10+T2>=24                                                                                                %时刻值大于或等于24则跳出
            break;
        end
        tar_ind = find(time(:,9)==num2str(T1) & time(:,10)==num2str(T2));                        %找出所有T1T2时刻对应的记
        for d = 1:7
            tar_ind_d =tar_ind(d:7:end) ;                                                                                    %找出星期n的所有记录（下标），8.1号为星期五，选择不同其实位置，则可选不同星期
            tar_data = Dealtimesum_281(tar_ind_d);                                                                  %通过下标找到数据
            train_vaule(T1*10+T2+1,d) = train_function(tar_data);                                             %训练样本，得到一个代表输入数据的一个值
        end
    end
end
temp = [train_vaule(:,[4:end]),train_vaule(:,[1:3])];                                                            %矫正星期，矫正后，第一列为星期一
train_vaule = temp
%save train_data.mat train_vaule
%[r,c] = size(train_vaule);
%train_vaule
%stem(1:r,tar_data(:,1),'o')                                                                                              %画图
%title('00时每个日期一天总人数') 
 
 
 
 