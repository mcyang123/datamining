 load('281_data_y_m_d_h');                                                                                             %选择281_Dealtime.mat或565_Dealtime.mat则可选不同线路 导入数据    
 index_1 = find(strcat(num2str(month),num2str(day)),'81');
 index_2 = find(strcat(num2str(month),num2str(day)),'82');
 index_3 = find(strcat(num2str(month),num2str(day)),'83');
 index_4 = find(strcat(num2str(month),num2str(day)),'84');
 index_5 = find(strcat(num2str(month),num2str(day)),'85');
 index_6 = find(strcat(num2str(month),num2str(day)),'86');
 index_7 = find(strcat(num2str(month),num2str(day)),'87');
 index_all = [index_1,index_2,index_3,index_4,index_5,index_6,index_7];
 hour(index_all) = [];
 week(index_all) = [];
 total(index_all) = [];
 
 day(index_all);
 
 %figure;
 %hold on 
 for w = 1:7
     for h  = 0:23
         h_i = find(hour ==h);
         w_i = find(week == w);
         T_index = ismember(h_i,w_i);
         index = h_i(T_index);
         datain = total(index);
         dataout = train_function(datain)
         
         
         %--------------7*24特征点输出--------------------
%          X = zeros(1,length(dataout));
%          X(:,:) = w;
%          plot(X,dataout,'o');
         %---------------------------------------------------
     end

 end
% hold off
 