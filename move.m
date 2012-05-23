function [ newpos newfit ] = move( S, N, grid, agents, cur_fit, pubfit, pubidx)
%MOVE Summary of this function goes here
%   Detailed explanation goes here

    newpos = zeros(N,2);
    newfit = zeros(N,1);
    
%     pubfit
%     pubidx
%     pubidx_tmp = [pubfit ; pubidx];
%     pubidx_sort = sortrows(pubidx_tmp,1); % sort by fit
    
    for i=1:N
        pos = agents(i,:);
        fit = cur_fit(:,i);
        [nPos nFit] = analyzeNeighborhood(S, grid, pos);
        
        [newpos(i,:) newfit(i)] = decideWhereToMove(S, agents, pos, fit, nPos, nFit, pubfit, pubidx); 

    end
  
end





function [nPos, nMax] = analyzeNeighborhood(S, grid, pos)
    
    nPos = [-1,-1];     % best neighbor position
    nMax = -1000;       % best neighbor fit
    
    % Define the n-order Moore neighborhood
    neigh = [-1 -1; 0 -1; 1 -1; 1 0; 1 1; 0 1; -1 1; -1 0]; 
    neigh = [neigh ; 2.*neigh]; 
    
    % Iterate over the neighbors  
    for k=1:size(neigh,1)
        ngbr_r = pos(1,1) + neigh(k, 1);
        ngbr_c = pos(1,2) + neigh(k, 2);
       
        % Check that the cell is within the grid boundaries
        if (isWithinGrid(S, ngbr_r, ngbr_c))
            f = compfit(grid, [ngbr_r, ngbr_c]);
            if (f > nMax)
                nMax = f;
                nPos = [ngbr_r ngbr_c];
            end
        end
    end
    
end
