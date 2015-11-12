load('daylist.mat');
load('281_data_y_m_d_h');    
z_axis = zeros(length(day),24);
for i =1:length(year)
    index = 1;
    D = strcat(num2str(month(i)),num2str(day(i)));
    while  ~strcmp(day_cell{index},D)
    index = index+1;
    end
    z_axis( index,hour(i)+1) =total(i);
end
size(z_axis)
size([1:length(day)])
size([1:24])
   %plot3([1:length(day)],[1:24],z_axis)