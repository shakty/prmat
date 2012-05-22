function [ f ] = compfit( grid, agents)
%COMPFIT Summary of this function goes here
%   Detailed explanation goes here

    % convert a position on the grid to a point in space
    pos_agents = locateAgents(grid, agents);
    
    % compute the fitness of all the points
    f = fitness(pos_agents);
end

