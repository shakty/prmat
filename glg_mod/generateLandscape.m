%% Clear

clc
clear
%close all

%% Init

dimension = 2;

nGaussian = 2;

lower = 0;
upper = 1;

space_begin = 0;    
space_end   = 1;
step = 0.1;         % size of the step in the grid
N = (space_end - space_begin) / step;

globalvalue = 1;

ratio = 0.9;

clear global covmatrix_inv;
clear global meanvector;
clear global optimumvalue;

global covmatrix_inv;   %the inverse covariance matrix of each component
global optimumvalue;    %the peak value of each component
global meanvector;      %the mean of each component
global variance;        %the variance of each component

%%

% Generate mean vectors randomly within [lower, upper]
meanvector = rand(nGaussian,dimension)*(upper-lower)+lower; 

% Variance
variancerange=(upper-lower)/20;   % this controls the range of variances
variance = rand(nGaussian,dimension)*variancerange+0.05;  % add 0.05 to avoid zero variance

% Generate inverse covariance matrix
covmatrix_inv = generateCovMat(dimension, nGaussian);

% Peaks values
% the first Gaussian is set to be the global optimum
optimumvalue(1) = globalvalue;     
% values of others are randomly generated within [0,globalvalue*ratio]
optimumvalue(2:nGaussian) = rand(1,nGaussian-1)*globalvalue*ratio;

%%

fitLandscape = evaluateLandscape(space_begin, space_end, step);

landscape3D(fitLandscape, lower, upper, step);
landscapeContour(fitLandscape, lower, upper, step);


