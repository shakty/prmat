function z = plotlandscape(upper,lower,N)

%--------------------------------------------------------------------------
%This is the plotting function of the Gaussian landscape generator(2D only)
%
%Syntax: plotlandscape(upper,lower,N)
%
%Example:plotlandscape(5,-5,100)
%
%Inputs:
%       upper boundary of the search space
%       lower boundary of the search space
%       number of sampling points
%
%Outputs:
%       3D surface plot
%       2D contour plot
%
%Author: Bo Yuan (boyuan@itee.uq.edu.au)
%--------------------------------------------------------------------------

if nargin~=3
    
    disp('Usage: plotlandscape(upper,lower,N)');
    return;
    
end

if upper<=lower
    
    disp('Upper must be larger than Lower!');
    return;
    
end

if N<10
    
    disp('Incorrect N value!');
    return;
    
end

%-----------------------------------------------------

inc=(upper-lower)/N;

x=lower:inc:upper;     %x coordinates
y=lower:inc:upper;     %y coordinates

d=length(y);

pos=zeros(d*d,2);      %(x,y)coordinates for all sampling points

for i=1:d
    
    pos((i-1)*d+1:i*d,1)=x(i)*ones(d,1);
    
end

pos(:,2)=repmat(y',d,1);

f=fitness(pos);        %evaluate individuals

z=vec2mat(f,d)';       %transform into a matrix

figure;
  
colormap(gray);        %3D surface plot
surfl(x,y,z);
shading interp;

figure;

[C,H]=contour(x,y,z);  %2D contour plot
colorbar;