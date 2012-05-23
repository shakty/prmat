function [fitnessvalue,components] = fitness(x)

%--------------------------------------------------------------------------
%This is the fitness function of the Gaussian landscape generator
%
%Syntax: [fitnessvalue,components]=fitness(x)
%
%Inputs:
%        individuals stored in a p-by-n matrix x
%
%Outputs:
%        the fitness value of each row in x
%        the value of each row in x generated by each component
%
%Author: Bo Yuan (boyuan@itee.uq.edu.au)
%--------------------------------------------------------------------------

global covmatrix_inv;  %the inverse covariance matrix of each component
global meanvector;     %the mean of each component
global optimumvalue;   %the peak value of each component

if isempty(covmatrix_inv)|isempty(meanvector)|isempty(optimumvalue)
    
    disp('Run initialize function first!');
    return;
    
end

nGaussian=size(meanvector,1);  % total number of components

[p,n]=size(x);                 % p: number of individuals; n: dimensionality

if n~=size(meanvector,2)
    
    disp('Incorrect dimension of inputs!');
    return;
    
end

tmp=zeros(nGaussian,p);

%----------------------------------------------------

for i=1:nGaussian              % calculate the values generated by each component
    
    newx=x-repmat(meanvector(i,:),p,1);
    
    z=(newx*covmatrix_inv{i}).*newx;
           
    tmp(i,:)=sum(z,2)';        
   
end

f=exp(-0.5*tmp/n);             % f is a nGaussian-by-p matrix

f=f.*repmat(optimumvalue',1,p);% multiply the peak value of each component

components=f';                 % the value of each individual generated by each component

fitnessvalue=max(f,[],1);      % choose the maximum values as the fitness values