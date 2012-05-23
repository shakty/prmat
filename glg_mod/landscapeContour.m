function h = landscapeContour(fitLandscape, lower, upper, step)
%LANDSCAPECONTOUR Summary of this function goes here
%   Detailed explanation goes here
    
    x = lower:step:upper;     %x coordinates
    y = lower:step:upper;     %y coordinates
    
    h = figure;
    display('b');
    [C,H]=contour(x,y,fitLandscape);  %2D contour plot
    colorbar;
end

