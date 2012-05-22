%% Clear workspace

clear
clc

%% Init parameters

REPEAT      = 1;
NUMITER     = 1;

N   = 100;      % n. of scientists
NR  = 3;        % n. of reviewers for paper

Tr = 0.5;       % threshold for publication

S = 100;        % size of the epistemic landscape

nClusters           = [0];    	% number of clusters of the initial positions
clusterTightness    = [0.25];   % Tightness of clusters

%% Generate Landscape
figure
landscape = generate_landscape(S);
imagesc(landscape);


%% Place Agents on landscape
agents = place_agents(S, N);
figure
plot(agents(:,1), agents(:,2),'rx'); 

%agents = initial_pos_clustered(nClusters,clusterTightness,n_agents,...
%                                ideas_space_size,ideas_space_dim);

%% Simulate
for i=1:REPEAT
    for j=1:NUMITER
        scores = simulation(landscape, agents, NR, Tr);
    end
end
    