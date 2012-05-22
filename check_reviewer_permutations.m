function ok = check_reviewer_permutations( reviewers )
%CHECK_REVIEWER_PERMUTATIONS Summary of this function goes here
%   Detailed explanation goes here

    ok = 1;
    for i=1:size(reviewers,1)
        if (ok == 0)
            break;
        end
        for j=1:size(reviewers,2)
            if (reviewers(i,j) == i)
                display('Self review');
                reviewers(i,j)
                ok = 0;
                break;
            end
            
            if (j > 1 && reviewers(i,j) == reviewers(i, (j-1)))
                display('Repeated reviewer');
                reviewers(i,j)
                ok = 0;
                break;
            end
        end
    end
    

end

