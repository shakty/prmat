function [ z ] = evaluateLandscape( lower, upper, step,  covmatrix_inv, ...
                                    meanvector, optimumvalue)
%EVALUATELANDSCAPE Summary of this function goes here
%   Detailed explanation goes here

    %x coordinates
    x = lower:step:upper;     
    %y coordinates
    y = x;     
    d=length(y);
    %(x,y)coordinates for all sampling points
    pos = zeros(d*d,2);      

    for i=1:d
        pos((i-1)*d+1:i*d,1)=x(i)*ones(d,1);
    end

    pos(:,2) = repmat(y',d,1);

    %evaluate individuals
    f = fitness(covmatrix_inv, meanvector, optimumvalue, pos);        

    %transform into a matrix
    z = vec2mat(f,d)';       

end

