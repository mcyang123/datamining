function [ Tra] = estimate( Hour,week)
%ͨ�����ں�ʱ����Ϣ����7��*24Сʱ��ÿ������
% ����Hour���ݱ��ʱ�������ݣ�weekΪ���������ݣ�����7*24����ÿ��Ԫ�ش���ĳ�죬ĳʱ�̵Ĺ�������
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

