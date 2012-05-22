%% Clear workspace

clear
clc

%% Add Gaussian Landscape Generator to path

path(path, 'glg/');


%% Init parameters

REPEAT      = 1;
NUMITER     = 1;

N   = 100;      % n. of scientists
NR  = 3;        % n. of reviewers for paper

Tr = 0.5;       % threshold for publication

step = 0.0001;    % size of the step in the grid
S = 1 / step;   % total number of spots in the grid per side

nClusters           = [0];    	% number of clusters of the initial positions
clusterTightness    = [0.25];   % Tightness of clusters

%% Generate Grid

grid = [0:step:1,0:step:1];

%% Generate Landscape

initialize(2,1,1,0,1,0.5);
%plotlandscape(2,0,10);

%% Place Agents on landscape

agents = place_agents(S, N);
% figure
%hold on
%plot(agents(:,1), agents(:,2),'rx'); 
%hold off
%agents = initial_pos_clustered(nClusters,clusterTightness,n_agents,...
%                                ideas_space_size,ideas_space_dim);

%% Simulate
for i=1:REPEAT
    for j=1:NUMITER
        [scores score_stats diffs dists dists_stats] = simulation(grid, agents, NR, Tr);
    end
end
    