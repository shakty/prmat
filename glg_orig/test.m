%% Clear

clc
clear
%close all

%% Init

dimension = 2;

nGaussian = 2;

upper = 1;

lower = 0;

globalvalue = 1;

ratio = 0.9;


%% Generate rotation matrix

e=diag(ones(1,dimension));   % unit diagonal matrix

%%
rotation = cell(nGaussian);
for i=1:nGaussian
    
   rotation{i}=e;            % initial rotation matrix for each Gaussian
   
end

%%

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

%% Generate covariance matrix

variancerange=(upper-lower)/2000;   % this controls the range of variances

variance=rand(nGaussian,dimension)*variancerange;  % add 0.05 to avoid zero variance

variance = [0.0001; 0.001]

%%

for i=1:nGaussian

      covmatrix=diag(variance(i,:));
      covmatrix=rotation{i}'*covmatrix*rotation{i};
      covmatrix_inv{i}=inv(covmatrix);
      
end

%%

% Generate mean vectors randomly within [lower, upper]
meanvector=rand(nGaussian,dimension)*(upper-lower)+lower; 

meanvector = [0.5, 0.5; 0.2, 0.2]

% assign values to components
optimumvalue(1)=globalvalue;     % the first Gaussian is set to be the global optimum

% values of others are randomly generated within [0,globalvalue*ratio]
optimumvalue(2:nGaussian)=rand(1,nGaussian-1)*globalvalue*ratio;



%-----------------------------------------------------
%% plot

% upper,lower,N, what
N = 10;
what = 3;

inc=(upper-lower)/N;

x=lower:inc:upper;     %x coordinates
y=lower:inc:upper;     %y coordinates

d=length(y);

pos=zeros(d*d,2);      %(x,y)coordinates for all sampling points

%%

for i=1:d
    
    pos((i-1)*d+1:i*d,1)=x(i)*ones(d,1);
    
end

%%

pos(:,2)=repmat(y',d,1);


%--------------------------------------------
%%

nGaussian=size(meanvector,1);  % total number of components

[p,n]=size(pos);                 % p: number of individuals; n: dimensionality

tmp=zeros(nGaussian,p);


%% calculate the values generated by each component

for i=1:nGaussian              
    
    newx=pos-repmat(meanvector(i,:),p,1);
    
    z=(newx*covmatrix_inv{i}).*newx;
           
    tmp(i,:)=sum(z,2)';        
   
end

%%

% normalize
f=exp(-0.5*tmp/n);             % f is a nGaussian-by-p matrix

%%

optimumvalue


f=f.*repmat(optimumvalue',1,p);% multiply the peak value of each component

%%

components=f';                 % the value of each individual generated by each component

%%

fitnessvalue=max(f,[],1);      % choose the maximum values as the fitness values

%%

f = fitnessvalue;

%-------------------------------------

%%

z=vec2mat(f,d)';       %transform into a matrix

%%

if (what == 1 || what == 3)
    figure;
    display('a');
    colormap(gray);        %3D surface plot
    surfl(x,y,z);
    shading interp;
end

if (what > 1)
    figure;
    display('b');
    [C,H]=contour(x,y,z);  %2D contour plot
    colorbar;
end

