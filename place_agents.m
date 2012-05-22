function agents = place_agents(S, N)
%PLACE_AGENTS Summary of this function goes here
%   Detailed explanation goes here

    agents = randi_placement(S, N);
end


function a = randi_placement(S, N)
    a = randi(S, N, 2);
end