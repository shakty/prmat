function [ f ] = compfit( landscape, agents)
%COMPFIT Summary of this function goes here
%   Detailed explanation goes here

    N = size(agents,1);
    % convert a position on th
    % compute the fitness of all the points
    f = zeros(N,1);
    for i=1:N
        f(i) = landscape(agents(i,1), agents(i,2));
    end
end

