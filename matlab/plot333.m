%%��ͬһ�����ڼ���ƽ������ͳ�Ƴ���
%%
load('281_data_y_m_d_h.mat');
x_axis = zeros(1,7); 
for w = 1:7
    index = find(week==w);
    x_axis(w) = sum(total(index))/length(index);
end
stem([1:7],x_axis)
    
