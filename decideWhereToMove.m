function [ new_pos, new_fit ] = decideWhereToMove( agents, pos, fit, nPos, nFit, pubfit, pubidx)
%DECIDEWHERETOMOVE Summary of this function goes here
%   Detailed explanation goes here

    % Compare neighbor position
    if (nFit > fit) 
        new_pos = nPos;
        new_fit = nFit;
    else
        new_pos = pos;
        new_fit = fit;
    end
    
    
    bestpub_idx = find(pubfit == max(pubfit));
    bestpub_fit = pubfit(bestpub_idx);
    if (bestpub_fit > new_fit)
        new_fit = bestpub_fit;
        new_pos = agents(bestpub_idx,:);
    end
end

