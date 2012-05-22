function [ latin ] = latinSquare( N, S )
%LATINSQUARE Summary of this function goes here
%   Detailed explanation goes here

    latin = zeros(N,S);
    seq = [1:N];
    	
    order = randperm(N);
    while order(1) == 1
        order = randperm(N);
    end
    
    for i=1:S
        start = order(i);
        finish = start-1;
        latin(:,i) = [seq(start:N) seq(1:finish)];
    end
end

