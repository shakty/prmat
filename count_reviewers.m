function count = count_reviewers( r )
%COUNT_REVIEWERS Summary of this function goes here
%   Detailed explanation goes here

    count = zeros(size(r,1),1);
    for i=1:size(r,1)
        for j=1:size(r,2)
            count(r(i,j)) = count(r(i,j)) + 1;
        end
    end

end

