function fitLandscape = generateLandscape(options)

    dimension = 2;

    % Try to determine the number of gaussian
    % components, or draw a random number
    if (isfield(options,'nGaussian'))
        nGaussian = options.nGaussian;
    elseif (isfield(options, 'optima'))
        nGaussian = size(options.optima,1);
    elseif (isfield(options, 'meanvector'))
        nGaussian = size(options.meanvector,1);
    elseif (isfield(options, 'variance'))
        nGaussian = size(options.variance,1);
    else
        nGaussian = randi(20,1);
    end

    % the top of the peaks and the bottom
    lower = options.lower;
    upper = options.upper;

    % the width and length of the epistemic space
    space_begin = options.space_begin;    
    space_end   = options.space_end;

    % size of the step in the grid
    step = options.step;


    % Optima
    % the peak value of each component
    if (isfield(options, 'optima'))
        optima = options.optima;
    else
        optima = zeros(nGaussian,1);
        optima(1) = upper;

        % Try to determine the ratio between global
        % optimum and other peaks, otherwise it is 1
        if (isfield(options,'optimaRatio'))
            optimaRatio = options.optimaRatio;
        else
            optimaRatio = 1;
        end

        optima(2:nGaussian) = rand(1,nGaussian-1)*upper*optimaRatio;
    end


    if (isfield(options, 'meanvector'))
        meanvector = options.meanvector;
    else

        % Generate mean vectors randomly within [lower, upper]
        % the mean of each component
        meanvector = rand(nGaussian,dimension)*(upper-lower)+lower; 
    end

    % Variance
    % the variance of each component
    if (isfield(options, 'variance'))
        variance = options.variance;
    else
        if (isfield(options, 'varianceRange'))
            varianceRange = options.varianceRange;
        else
            varianceRange=(upper-lower)/20;   
        end
        variance = rand(nGaussian,dimension)*varianceRange;
        variance =  variance + 0.05;  % add 0.05 to avoid zero variance
    end

    % Generate inverse covariance matrix:
    % the inverse covariance matrix of each component
    covmatrix_inv = generateCovMat(dimension, nGaussian, variance);

    fitLandscape = evaluateLandscape(space_begin, space_end, step, covmatrix_inv, meanvector, optima);

    if (isfield(options, 'plot3D') && options.plot3D)
        landscape3D(fitLandscape, lower, upper, step);
    end

    if (isfield(options, 'plotContour') && options.plotContour)
        landscapeContour(fitLandscape, lower, upper, step);
    end

end
