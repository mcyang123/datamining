function [] = txt_output( tra15,tra10 )
%%�ýű����ڽ�Ԥ����д��txt�е��ýű�ǰ��ȷ������˳��Ϊ565,281�������Զ������txt�ļ�
%
D =['0101';'0102';'0103';'0104';'0105';'0106';'0107'];
H =['06';'07';'08';'09';'10';'11';'12';'13';'14';'15';'16';'17';'18';'19';'20';'21'];
d= 1;
h = 1;
line = '��·15,';
data = [reshape(tra565',[],1) ; reshape(tra281',[],1)];
f = fopen('gd_predict.txt','wt');
for i = 1:length(data)
    
        if h>=17
            h=1;
            d=d+1;
        end
        if d>=8
            d=1;
            line = '��·10,';
        end
        fprintf(f,'%s',line);
        fprintf(f,'%s',strcat('2015',D(d,:)));
        fprintf(f,',');
        fprintf(f,'%s',H(h,:));
        fprintf(f,',');
        fprintf(f,'%d',round(data(i)));
        fprintf(f,'\n');
        h=h+1;
end
fclose(f);

end

