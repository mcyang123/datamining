 load('281_data_y_m_d_h');                                                                                             %ѡ��281_Dealtime.mat��565_Dealtime.mat���ѡ��ͬ��· ��������    
 Tra = zeros(7,24);
 for w = 1:7
     for h  = 0:23
         h_i = find(Hour ==h);
         w_i = find(week == w);
         T_index = ismember(h_i,w_i);
         index = h_i(T_index);
         datain = total(index);
         dataout = train_function(datain);
         Tra(w,h+1) = dataout;
         
         %--------------7*24���������--------------------
%          X = zeros(1,length(dataout));
%          X(:,:) = w;
%          plot(X,dataout,'o');
         %---------------------------------------------------
     end

 end
 out = Sample_catch(801,'281');
  score_count( out,Tra )
% hold off
 