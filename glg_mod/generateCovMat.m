function covmatrix_inv = generateCovMat(dimension, nGaussian)

%--------------------------------------------------------------------------
%Generates the covariance matrix for the gaussian landscape
%
%Syntax: generateCovMat(dimension,nGaussian,upper,lower,globalvalue,ratio)
%
%Example:generateCovMat(2,10)
%
%Inputs: 
%        dimensionality
%        upper and lower boundaries
%
%Outputs:
%        inverse covariance matrix
%        component peak value
%
%--------------------------------------------------------------------------


    global variance;        %the variance of each component


    % Generate rotation matrix
    e=diag(ones(1,dimension));   % unit diagonal matrix
    rotation = cell(nGaussian);  % initial rotation matrix for each Gaussian
    for i=1:nGaussian
       rotation{i}=e;           
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



    for i=1:nGaussian
          covmatrix=diag(variance(i,:));
          covmatrix=rotation{i}'*covmatrix*rotation{i};
          covmatrix_inv{i}=inv(covmatrix);
    end

end