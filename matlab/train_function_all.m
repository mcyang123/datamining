function [ output ] = train_function_all( input )
%%���������������ѵ����һ��7*16�����飬�Դ���Ϊ����ֵ ʱ��ֻ��6-21ʱ
%inputΪ�������ݣ�����Ϊ�ṹ������Date��Hour��week��weather��total��outputΪ������ݣ���СΪ7*24,����Ĭ�ϵ���train_function_single()Ϊѵ������
%%
 
 output = zeros(7,16);                                          %��ʼ������
 for w = 1:7                                                         %��������һ��������
     for h  = 6:21                                                  %����6-21ʱ
         h_i = find(input.Hour ==h);                        %�ҳ���hʱ�̵������±�
         w_i = find(input.week == w);                      %�ҳ�����w�������±�
         T_index = ismember(h_i,w_i);                       %ƥ�������±��б�T_indexΪh_i���±꣬
         index = h_i(T_index);                                   %ͨ��h_i�ҵ��������ݵ��±�
         datain = input.total(index);                          %�ҳ���������w��hʱ�̵�����
         dataout = train_function_single(datain);      %ѵ����һά����
         output(w,h-5) = dataout;                           %��¼�õ�������w��hʱ�̵Ĺ��Ƶ�
     end
 end
end

