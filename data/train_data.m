 %%�ű�����ѵ������ֵ�����ڵõ�һ��������ں�ʱ�̵Ĺ���ֵ
 
 
load('281_Dealtime.mat');                                                                                              %ѡ��281_Dealtime.mat��565_Dealtime.mat���ѡ��ͬ��·
time = cell2mat(Dealtime_281);                                                                                    %ת����ʽ����cellתΪchar��ʽ
train_vaule = zeros(24,7);
for T1 = 0:2                                                                                                                 %����T1T2�ɵ�ʱ��       
    for T2 = 0:9
        if T1*10+T2>=24                                                                                                %ʱ��ֵ���ڻ����24������
            break;
        end
        tar_ind = find(time(:,9)==num2str(T1) & time(:,10)==num2str(T2));                        %�ҳ�����T1T2ʱ�̶�Ӧ�ļ�
        for d = 1:7
            tar_ind_d =tar_ind(d:7:end) ;                                                                                    %�ҳ�����n�����м�¼���±꣩��8.1��Ϊ�����壬ѡ��ͬ��ʵλ�ã����ѡ��ͬ����
            tar_data = Dealtimesum_281(tar_ind_d);                                                                  %ͨ���±��ҵ�����
            train_vaule(T1*10+T2+1,d) = train_function(tar_data);                                             %ѵ���������õ�һ�������������ݵ�һ��ֵ
        end
    end
end
temp = [train_vaule(:,[4:end]),train_vaule(:,[1:3])];                                                            %�������ڣ������󣬵�һ��Ϊ����һ
train_vaule = temp
%save train_data.mat train_vaule
%[r,c] = size(train_vaule);
%train_vaule
%stem(1:r,tar_data(:,1),'o')                                                                                              %��ͼ
%title('00ʱÿ������һ��������') 
 
 
 
 