 %%�ýű����ڼ���00ʱ��23ʱ��ÿ��ʱ�̵�ƽ��������ƽ��������ʾ3�������м�¼��00ʱ�����м�¼��������00ʱ�м�¼������
 
 load('281_Dealtime.mat');
 time = Dealtime_281;
 %time = cell2mat(Dealtime_281);
 i =1;
 timesum= zeros(1,24);
 for T1 =0:9
     for T2 =0:9
      if T1*10+T2>=24
          break;
      end
      tar = find(time(:,9)==num2str(T1) & time(:,10)==num2str(T2));
      timesum(i) = sum(Dealtimesum_281(tar))/length(tar);
      i=i+1;
     end
 end
 %plot(0:23,timesum,'o')
 stem(0:23,timesum,'o')
 title('281��ʱ��ƽ������')
 
 