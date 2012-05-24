%% Clear workspace

clear
clc
close all

%% Add Gaussian Landscape Generator to path

path(path, 'glg_mod/');


%% Init parameters

REPEAT      = 1;
NUMITER     = 1;

N   = 100;      % n. of scientists
Nr  = 3;        % n. of reviewers for paper

Tr = -1000.0001;       % threshold for publication


space_begin = 0;
space_end = 1;

upper = 1;
lower = 0;
step = 0.001;   % size of the step in the grid
S = 1 / step;   % total number of spots in the grid per side

nClusters           = [0];    	% number of clusters of the initial positions
clusterTightness    = [0.25];   % Tightness of clusters


% model options
m_options = struct(...
                    'N',    N, ...
                    'Nr',   Nr, ...
                    'Tr',   Tr, ...
                    'S',    S ...
);


% landscape options
l_options = struct( ...
                    'nGaussian',    2, ...
                    'upper',        upper, ...
                    'lower',        lower, ...
                    'space_begin',  space_begin, ...
                    'space_end',    space_end, ...
                    'step',         step, ...
                    'plot3D',       0, ...
                    'plotContour',  0, ...
                    'optima',       [0.5 ; 1], ...
                    'variance',     [0.001 ; 0.001], ...
                    'meanvector',   [0.25, 0.25; 0.75, 0.75] ...
);

% l_options = struct( ...
%                     'nGaussian',    2, ...
%                     'upper',        upper, ...
%                     'lower',        lower, ...
%                     'space_begin',  space_begin, ...
%                     'space_end',    space_end, ...
%                     'step',         step, ...
%                     'plot3D',       1, ...
%                     'plotContour',  0 ...
% );


%% Generate Landscape
landscape = generateLandscape(l_options);

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
    agents = simulation(NUMITER, landscape, agents, m_options, l_options);
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


    