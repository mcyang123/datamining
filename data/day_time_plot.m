%%����Ϊ�����꣬����Ϊ�����꣬ÿ��ͼ��Ӧ��ͬʱ��
%
T1 = 0;                                                                                                                          %����T1T2�ɵ�ʱ��
T2 = 8;
 load('281_Dealtime.mat');                                                                                              %ѡ��281_Dealtime.mat��565_Dealtime.mat���ѡ��ͬ��·
 time = cell2mat(Dealtime_281);                                                                                     %ת����ʽ����cellתΪchar��ʽ
 tar = find(time(:,9)==num2str(T1) & time(:,10)==num2str(T2));                                      %�ҳ�����T1T2ʱ�̶�Ӧ�ļ�¼
 tar =tar(4:7:end) ;                                                                                                            %�ҳ�����n�����м�¼���±꣩��8.1��Ϊ�����壬ѡ��ͬ��ʵλ�ã����ѡ��ͬ����
 tar2 = Dealtimesum_281(tar);                                                                                           %ͨ���±��ҵ�����
 %day = time(tar,[5:8]);
 %day = str2num(day(:,:));
 stem(1:length(tar2),tar2,'o')                                                                                              %��ͼ
 title('00ʱÿ������һ��������')