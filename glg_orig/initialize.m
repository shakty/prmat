function initialize(dimension,nGaussian,upper,lower,globalvalue,ratio)

%--------------------------------------------------------------------------
%This is the initialization function of the Gaussian landscape generator
%
%Syntax: initialize(dimension,nGaussian,upper,lower,globalvalue,ratio)
%
%Example:initialize(2,10,5,-5,1,0.8)
%
%Inputs: 
%        dimensionality
%        number of Gaussian components
%        upper and lower boundaries
%        value of the global optimum
%        values of local optima ([0,ratio*globalvalue])
%
%Outputs:
%        inverse covariance matrix
%        meanvector
%        component peak value
%
%Author: Bo Yuan (boyuan@itee.uq.edu.au)
%--------------------------------------------------------------------------

clear global covmatrix_inv;
clear global meanvector;
clear global optimumvalue;

global covmatrix_inv;   %the inverse covariance matrix of each component
global meanvector;      %the mean of each component
global optimumvalue;    %the peak value of each component

if nargin<6
    
    disp('Usage: initialize(dimension,nGaussian,upper,lower,globalvalue,ratio)');
    return;    
    
end

if dimension<=1|nGaussian<=0|upper<=lower|globalvalue<=0|ratio<=0|ratio>=1
    
    disp('Incorrect parameter values!');
    return;
    
end

% Generate rotation matrix

e=diag(ones(1,dimension));   % unit diagonal matrix

for i=1:nGaussian
    
   rotation{i}=e;            % initial rotation matrix for each Gaussian
   
end

for i=1:nGaussian            

  for j=1:dimension-1        % totally n(n-1)/2 rotation matrice
      
      for k=j+1:dimension
          
        r=e;
        
        alpha=rand*pi/2-pi/4;% random rotation angle [-pi/4,pi/4]
        
        r(j,j)=cos(alpha);
        r(j,k)=sin(alpha);
        r(k,j)=-sin(alpha);
        r(k,k)=cos(alpha);
    
        rotation{i}=rotation{i}*r;
    
     end
    
  end
  
end

% Generate covariance matrix

variancerange=(upper-lower)/20;   % this controls the range of variances

variance=rand(nGaussian,dimension)*variancerange+0.05;  % add 0.05 to avoid zero variance

for i=1:nGaussian

      covmatrix=diag(variance(i,:));
      covmatrix=rotation{i}'*covmatrix*rotation{i};
      covmatrix_inv{i}=inv(covmatrix);
      
end

% Generate mean vectors randomly within [lower, upper]
meanvector=rand(nGaussian,dimension)*(upper-lower)+lower; 

% assign values to components
optimumvalue(1)=globalvalue;     % the first Gaussian is set to be the global optimum

% values of others are randomly generated within [0,globalvalue*ratio]
optimumvalue(2:nGaussian)=rand(1,nGaussian-1)*globalvalue*ratio;