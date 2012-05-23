function [ new_pos ] = randomPosInRange( S, R, pos )
%RANDOMWITHINRANGE Summary of this function goes here
%   Detailed explanation goes here
    
    imin_x = pos(1,1) - floor(R / 2);
    imax_x = pos(1,1) + floor(R / 2);
    
    imin_y = pos(1,2) - floor(R / 2);
    imax_y = pos(1,2) + floor(R / 2);
    
    
    new_pos = [randi([imin_x imax_x], 1) randi([imin_y imax_y], 1)];
    
    while (~isWithinGrid(S, new_pos(1,1), new_pos(1,2)))
        new_pos = [randi([imin_x imax_x], 1) randi([imin_y imax_y], 1)];
    end

end

