function agents = simulation( NUMITER, landscape, agents, m_options, l_options)
% function [score score_stats diffs dists dists_stats] = simulation( S, step, N, grid, agents, Nr , Tr)
%SIMULATION Summary of this function goes here
%   Detailed explanation goes here

% convert a position on the grid to a point in space
%pos_agents = locateAgents(grid, agents);

%pos_agents
%agents

S   = m_options.S;
N   = m_options.N;
Nr  = m_options.Nr;
Tr  = m_options.Tr;

step    = l_options.step;
upper   = l_options.upper;
lower   = l_options.lower;
    
    
for j=1:NUMITER

    % compute the fitness of all the agents
    f = compfit(landscape,agents);

    % compute the random indexes of the reviewers
    reviewers = latinSquare(N,Nr);
    
    % compute the score assigned by each reviewer to the
    % position of the agent in space
    [score score_stats diffs dists dists_stats] = review(f, agents, reviewers, step);
     
    difdists = [diffs  dists_stats(:,1)];
    sorted_difdists = sortrows(difdists,2);
    
%     figure
%     plot(sorted_difdists(:,1), 'rx');
%     title('Difference in evaluation for each agent sorted by distance distance');
%     
%     figure
%     plot(diffs, dists_stats(:,1),'rx');
%     title('Avg difference in evaluation as a function of distance');
    
    
%    b = (diffs'*diffs)^-1 * (diffs'*dists_stats(:,1));
%     
%     f = exp(mean(dists_stats(:,1)));
    
    

    % Publish
    publish_idx = find(score_stats(:,1) > Tr);
    publish_fit = score_stats(publish_idx,1);
    publish_pos = agents(publish_idx,:);

%    publish = [ publish_idx publish_pos publish_fit ];
 
%    landscapeContour(landscape, lower, upper, step);
%    drawnow
%    refreshdata
   hold on
   %figure
   plot(agents(:,1)*step,agents(:,2)*step,'bx');
   plot(publish_pos(:,1)*step,publish_pos(:,2)*step,'ro'); 
   hold off

   xlim([0 1]);
   ylim([0 1]);
   
    
    
    pause(0.1);
    
    
    %figure
    %imagesc(z);
    %[C,H]=contour(grid,grid,z);  %2D contour plot
    %colorbar;

    
    %hold off
    % Move
    
    [agents new_fits] = move(S, N, landscape, agents, f, publish_fit, publish_idx);
    
end

