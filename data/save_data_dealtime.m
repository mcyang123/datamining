%%????????????????????????????????
%%

f = fopen('281_Dealtime.csv');                     %???????????
datacell = textscan(f,'%s','%s');                  %??????????cell
datacell = datacell{1};                            %????cell?????cell
[r,c]= size(datacell);                             %??????????????????
datacell{1}(1:3)=[];                               %?????????????????????
Dealtime_281 = cell(r,1);                          %???cell???????????
Dealtimesum_281 = zeros(r,1);                          %?????????????????????
for i=1:r
    Dealtime_281{i} = datacell{i}(1:10);           %?????????????terminal_281?
    Dealtimesum_281(i) = str2num(datacell{i}(12:end)); %?????????????????terdata_281?
end
save 281_Dealtime.mat Dealtime_281 Dealtimesum_281     %??????mat??
fclose(f);                                         %????