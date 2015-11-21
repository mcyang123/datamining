function [ output ] = train_function_all( input,flag,fun)
%%���������������ѵ����һ��7*16�����飬�Դ���Ϊ����ֵ ʱ��ֻ��6-21ʱ
%inputΪ�������ݣ�����Ϊ�ṹ������Date��Hour��week��weather��total��outputΪ������ݣ���СΪ7*24,����Ĭ�ϵ���train_function_single()Ϊѵ������
%%
 if flag ==0                                                            %ѵ��������������
     output = zeros(7,16);                                          %��ʼ������
     for w = 1:7                                                         %��������һ��������
         for h  = 6:21                                                  %����6-21ʱ
             h_i = find(input.Hour ==h);                        %�ҳ���hʱ�̵������±�
             w_i = find(input.week == w);                      %�ҳ�����w�������±�
             t_i = find(input.tag == 0);                          %�ҳ�����״̬�������±�
             wh_i = intersect(w_i,h_i);   
             index = intersect(wh_i,t_i);                           %ĳ���ڼ���ĳʱ���£�����״̬�����ڵ�����
             datain = input.total(index);                          %�ҳ���������w��hʱ������״̬������
             dataout = fun(datain);                                %ѵ����һά����
             output(w,h-5) = dataout;                           %��¼�õ�������w��hʱ�̵Ĺ��Ƶ�
         end
     end
     
 elseif flag ==1                                                        %ѵ������������
    output =zeros(2,16);
    %------------------------�ҵ����зż�����---------------------------------
    w_i = find(input.week ==6  | input.week ==7);     %�ҳ�����������
    t_i = find(input.tag == 0);                                     %��ǩ����������
    wt_i1 = intersect(w_i,t_i);                                        %���������ҳ�����������������
    w_i = find(input.week >=1 & input.week <=5);     %�ҳ���״̬����һ������
    t_i = find(input.tag == 1);  
    wt_i2 = intersect(w_i,t_i);                                         %���������ҳ�����������һ����������
    wt_i = union(wt_i1,wt_i2);                                       %�������������պͷ���������һ���������ݺϲ�
    for h = 6:21
        h_i = find(input.Hour == h);                              %�����ݰ�ʱ��ֵ�ֿ�
        index = intersect(h_i,wt_i);                                 %�ż������£�ĳʱ�̵����ݵ��±�
        datain = input.total(index);                               %�ҵ����ݵ�
        dataout = fun(datain);                                      %ѵ������
        output(1,h-5) = dataout;                                     %��¼����
    end

    %---------------------------------------------------------------------------
    
    %------------------------�ҵ������ϰ�����---------------------------------
    w_i = find(input.week ==6  | input.week ==7);     %�ҳ����������� 
    t_i = find(input.tag == 1);                                      %��ǩ������������
    wt_i1 = intersect(w_i,t_i);                                         %���������ҳ������������������ݣ��ϰࣩ
    w_i = find(input.week >=1 & input.week <=5);      %�ҳ���һ����������
    t_i = find(input.tag == 0);  
    wt_i2 = intersect(w_i,t_i);                                         %�ҳ�����״̬����һ������
    wt_i = union(wt_i1,wt_i2);                                        %���������ҳ��ϰ����������
    for h = 6:21
        h_i = find(input.Hour == h);                               %�����ݰ�ʱ��ֵ�ֿ�
        index = intersect(h_i,wt_i);                                   %�ϰ������£�ĳʱ�̵����ݵ��±�
        datain = input.total(index);                                 %�ҵ����ݵ�
        dataout = fun(datain);                                       %ѵ������
        output(2,h-5) = dataout;                                     %��¼����
    end
    %------------------------------------------------------------------------------
 end
end

