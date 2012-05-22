function scores = simulation( landscape, agents, NR , Tr)
%SIMULATION Summary of this function goes here
%   Detailed explanation goes here


    % Review
    N = size(agents,1);
    rr = permute_reviewers(N);
    rr = rr(:,1:NR);
    scores = zeros(1,N);
    for i=1:N
        scores_i = zeros(NR,1);
        for j=1:NR
            reviewer = agents(rr(i,j),:);
            rx = reviewer(1);
            ry = reviewer(2);
            scores_i(j) = review(landscape, agents(i,1),agents(i,2), rx, ry);
        end
        scores(i) = mean(scores_i);
            
    end
    
    % Publish
    publish = agents(find(scores > Tr),:);
    figure
    plot(publish(:,1),publish(:,2),'rx'); 
    
    
    % Move
    
    
    % Evaluate Moore's Neighborhood
    
    
    
    % Evaluate Published position
    
    
    % Move
    
    
end

