function [ f ] = compfit( landscape, agents)
%COMPFIT Summary of this function goes here
%   Detailed explanation goes here

    % convert a position on th
    % compute the fitness of all the points
    f = landscape(agents(:,1), agents(:,2));
end

