function [score, score_stats, diffs, dists, dists_stats] = review( fitness, agents, reviewers, step)
%REVIEW Summary of this function goes here
%   Detailed explanation goes here
    
    N   = size(agents,1);       % n. agents
    Nr  = size(reviewers,2);    % n. reviewers per agent
    
    score = zeros(N,Nr);        % individual scores by reviewer
    diffs = zeros(N,1);         % difference between avg score and real value
    dists = zeros(N,Nr);        % individual distance of the reviewer
    
    score_stats = zeros(N,2);   % mean, std
    dists_stats = zeros(N,2);   % mean, std
    
    for i=1:N
        
        % original value of approach used by agent i
        orig_value = fitness(i);    
        
        for j=1:Nr
            % reviewer j for agent i
            r = agents(reviewers(i,j),:);
            
            % d: Eucledian distance points i,j
            % must be converted to real distance (*step)
            d = abs(norm(agents(i,:)) - norm(r)) * step;
            dists(i,j) = d;
            
            
            % interpreted value from reviewer
            score(i,j) = review_exp(orig_value, d);
        end
        
        score_stats(i,1) = mean(score(i,:));
        score_stats(i,2) = std(score(i,:));
        
        diffs(i) = orig_value - score_stats(i,1);
        
        dists_stats(i,1) = mean(dists(i,:));
        dists_stats(i,2) = std(dists(i,:));
        
    end
end


function score = review_exp( v, d)

    d0 = 1;
    A = 1;
    score = v - A * (1 - exp( -d / d0));

end


function score = review_landscape( v, d)
    score = v;
end



function score = review_lognormal( landscape, x, y, xr, yr)

    score = rand(1,1);

end