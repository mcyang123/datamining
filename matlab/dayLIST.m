
%D1 = 0;
D2 = 1;
%M1 = 0;
M2 = 8;
day_cell = cell(153,1);
i =1;
day = '81';
while i<=153
day = strcat(num2str(M2),num2str(D2));
if  strcmp(day,'831') | strcmp(day,'930') |strcmp(day,'1031') |strcmp(day,'1130')
    D2 = 0;
    M2 =M2+1;
end
D2=D2+1;
day_cell{i} =day;
i = i+1;
end
daylist = day_cell;
save daylist.mat daylist