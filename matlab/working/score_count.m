function [score,dev_a ]= score_count( real, estimate )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
dev = abs(real-estimate)./real;
dev_a = sum(sum(dev))/(7*16);
dev(dev>0.3) = 0.3;
f = (1-dev./0.3)*10;
[r ,c] = size(f);
score = sum(sum(f))/(10*r*c);

end
