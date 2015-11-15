
D1 = 0;
D2 = 1;
%M1 = 0;
M2 = 8;
day_cell = cell(153,1);
i =1;
day = '801';
while i<=153
day = strcat(num2str(M2),num2str(D1),num2str(D2));
if  strcmp(day,'831') | strcmp(day,'930') |strcmp(day,'1031') |strcmp(day,'1130')
    D2 = 0;
    D1 = 0;
    M2 =M2+1;
end
D2=D2+1;
if D2>=10
    D2=0;
    D1=D1+1;
end
day_cell{i} =day;
i = i+1;
end
for i=1:length(day_cell)
    s = day_cell{i};
    daylist(i) = str2num(s);
end
save daylist.mat daylist