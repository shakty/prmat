function h = landscape3D(fitLandscape, lower, upper, step)

    x = lower:step:upper;     %x coordinates
    y = lower:step:upper;     %y coordinates

    h = figure;
    colormap(gray);        %3D surface plot
    surfl(x,y,fitLandscape);
    shading interp;
end