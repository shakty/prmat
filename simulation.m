function [scores score_stats diffs dists dists_stats] = simulation( grid, agents, NR , Tr)
%SIMULATION Summary of this function goes here
%   Detailed explanation goes here

    % n. of agents
    N = size(agents,1); 

    % convert a position on the grid to a point in space
    pos_agents = locateAgents(grid, agents);
    
    % compute the fitness of all the points
    f = fitness(pos_agents);
    
    % compute the random indexes of the reviewers
    reviewers = latinSquare(N,NR);
    
    % compute the score assigned by each reviewer to the
    % position of the agent in space
    [scores score_stats diffs dists dists_stats] = review(f, pos_agents, reviewers);
    
    difdists = [diffs  dists_stats(:,1)]
    
    sorted_difdists = sortrows(difdists,2)
    
    figure
    plot(sorted_difdists(:,1));
    
    
    figure
    plot(diffs, dists_stats(:,1))
    
    b = (diffs'*diffs)^-1 * (diffs'*dists_stats(:,1))
    
    f = exp(mean(dists_stats(:,1)))
    
    % Publish
    %publish = agents(find(scores > Tr),:);
    
    %figure
    %plot(publish(:,1),publish(:,2),'rx'); 
    
    
    % Move
    
    
    % Evaluate Moore's Neighborhood
    
    
    
    % Evaluate Published position
    
    
    % Move
    
end

