function [score score_stats diffs dists dists_stats] = simulation( S, step, N, grid, agents, Nr , Tr)
%SIMULATION Summary of this function goes here
%   Detailed explanation goes here

    % convert a position on the grid to a point in space
    pos_agents = locateAgents(grid, agents);
    
    % compute the fitness of all the points
    f = fitness(pos_agents);
    
    % compute the random indexes of the reviewers
    reviewers = latinSquare(N,Nr);
    
    % compute the score assigned by each reviewer to the
    % position of the agent in space
    [score score_stats diffs dists dists_stats] = review(f, pos_agents, reviewers);
     
%     difdists = [diffs  dists_stats(:,1)]
%     
%     sorted_difdists = sortrows(difdists,2)
%     
%     figure
%     plot(sorted_difdists(:,1));
%     
%     
%     figure
%     plot(diffs, dists_stats(:,1),'rx')
%     
%     b = (diffs'*diffs)^-1 * (diffs'*dists_stats(:,1));
%     
%     f = exp(mean(dists_stats(:,1)));
    
    

    % Publish
    publish = pos_agents(score_stats(:,1) > Tr,:);
    
    figure
    hold on
    plot(pos_agents(:,1),pos_agents(:,2),'bx'); 
    plot(publish(:,1),publish(:,2),'rx'); 
    
%     x = [0:step:1];
%     y = x;
%     z = zeros(S);
%     
%     for i=1:N
%         z(agents(i,:)) = score_stats(i,1);
%     end
%     
    
    xlim([0 1]);
    ylim([0 1]);
    
    hold off
%     figure
%     
%     size(z);
%     
%     imagesc(z);
%     %[C,H]=contour(x,y,z);  %2D contour plot
%     colorbar;

    
    
    
    hold off
    % Move
    
    
    % Evaluate Moore's Neighborhood
    
    
    
    % Evaluate Published position
    
    
    % Move
    
end

