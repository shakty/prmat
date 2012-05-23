function [ new_pos ] = randomPosInRange( S, R, pos )
%RANDOMWITHINRANGE Summary of this function goes here
%   Detailed explanation goes here
    
    imin = pos(1,1) - floor(R / 2);
    imax = pos(1,2) + floor(R / 2);
    
    new_pos = randi([imin imax], 1, 2);
    
    while (~isWithinGrid(S, new_pos(1,1), new_pos(1,2)))
        new_pos = randi([imin imax], 1, 2);
    end

end

