function agents = simulation( S, step, N, grid, agents, Nr , Tr)
% function [score score_stats diffs dists dists_stats] = simulation( S, step, N, grid, agents, Nr , Tr)
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
    fit_t = f';
    publish_idx = find(score_stats(:,1) > Tr);
    publish_fit = fit_t(publish_idx,:);
    publish_pos = pos_agents(publish_idx,:);
    
%     size(publish_idx)
%     size(publish_pos)
%     size(publish_fit)

%    publish = [ publish_idx publish_pos publish_fit ];
%     
%     
%    figure
    %hold on
%    plotlandscape(1,0,10,2);
    plot(pos_agents(:,1),pos_agents(:,2),'bx'); 
    plot(publish_pos(:,1),publish_pos(:,2),'ro'); 
    refreshdata
    drawnow
%     
%     
%     z = zeros(S);     
%     for i=1:N
%        z(agents(i,:)) = score_stats(i,1);
%     end
%     
%     
    xlim([0 1]);
    ylim([0 1]);
    %hold off
   
    pause(1);
    
    
    %figure
    %imagesc(z);
    %[C,H]=contour(grid,grid,z);  %2D contour plot
    %colorbar;

    
    %hold off
    % Move
    
    [agents new_fits] = move(N, grid, agents, f, publish_fit, publish_idx);
    
end

