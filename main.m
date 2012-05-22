%% Clear workspace

clear
clc
close all

%% Add Gaussian Landscape Generator to path

path(path, 'glg/');


%% Init parameters

REPEAT      = 1;
NUMITER     = 10;

N   = 100;      % n. of scientists
NR  = 3;        % n. of reviewers for paper

Tr = 0.7;       % threshold for publication

step = 0.0001;    % size of the step in the grid
S = 1 / step;   % total number of spots in the grid per side

nClusters           = [0];    	% number of clusters of the initial positions
clusterTightness    = [0.25];   % Tightness of clusters

%% Generate Grid

grid = [0:step:1];

%% Generate Landscape

initialize(2,1,1,0,1,0.5);
plotlandscape(1,0,10,3);

%% Place Agents on landscape

agents = place_agents(S, N);

%figure
%hold on
%plot(agents(:,1), agents(:,2),'rx'); 
%hold off
%agents = initial_pos_clustered(nClusters,clusterTightness,n_agents,...
%                                ideas_space_size,ideas_space_dim);

%% Simulate
for i=1:REPEAT
    for j=1:NUMITER
        agents = simulation(S, step, N, grid, agents, NR, Tr);
        if (j ~= NUMITER)
            %cla
        end
        j
    end
    
     
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

end
    