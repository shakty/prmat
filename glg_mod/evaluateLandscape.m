function [ z ] = evaluateLandscape( lower, upper, step )
%EVALUATELANDSCAPE Summary of this function goes here
%   Detailed explanation goes here

    x = lower:step:upper;     %x coordinates
    y = x;     %y coordinates
    d=length(y);
    pos = zeros(d*d,2);      %(x,y)coordinates for all sampling points

    for i=1:d
        pos((i-1)*d+1:i*d,1)=x(i)*ones(d,1);
    end

    pos(:,2)=repmat(y',d,1);

    f=fitness(pos);        %evaluate individuals

    z=vec2mat(f,d)';       %transform into a matrix

end

