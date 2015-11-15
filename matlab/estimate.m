function [ Tra] = estimate( Hour,week)
%通过星期和时刻信息估计7天*24小时的每天人数
% 输入Hour数据表的时刻列数据，week为星期列数据，返回7*24矩阵，每个元素代表某天，某时刻的估计人数
 Tra = zeros(7,24);
 for w = 1:7
     for h  = 0:23
         h_i = find(Hour ==h);
         w_i = find(Hour == w);
         T_index = ismember(h_i,w_i);
         index = h_i(T_index);
         datain = total(index);
         dataout = train_function(datain);
         Tra(w,h+1) = dataout;
     end
 end
end

