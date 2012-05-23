function [ new_pos, new_fit ] = decideWhereToMove( S, agents, pos, fit, nPos, nFit, pubfit, pubidx)
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
    
    bestpub = pubfit == max(pubfit);
    bestpub_fit = pubfit(bestpub);
    bestpub_idx = pubidx(bestpub);
    
    if (bestpub_fit > new_fit)
        new_fit = bestpub_fit;
        
        % Exactly the same position
        new_pos = agents(bestpub_idx,:);
        
        % Add noise
        R = floor(S*0.3);
        new_pos = randomPosInRange(S, R, new_pos);
    end
end


