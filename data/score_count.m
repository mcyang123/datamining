function score= score_count( real, estimate )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
dev = abs(real-estimate)./real;
dev(dev>0.3) = 0.3;
f = (1-dev./0.3)*10;
f = sum(f)/(10*length(f));
end

