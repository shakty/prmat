function landscape = generate_landscape( S, D )
%CREATE_LANDSCAPE Summary of this function goes here
%   Detailed explanation goes here
    
    %landscape = flat_landscape(S);
    landscape = norm_landscape(S);

end


function l = flat_landscape(S)
    l = ones(S,S);
end

function l = norm_landscape(S)
    l = randn(S,S);
end
