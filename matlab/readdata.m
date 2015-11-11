fid = fopen('D:\project\datamining\data\281_Terminal.csv');  
dcells = textscan(fid,'%s,%s');  
fclose(fid);  
dcellneeds = dcells(:);  
Mat = cell2mat(dcellneeds);  
disp(Mat); 