function reviewers = permute_reviewers(N)
%PERMUTE_REVIEWERS Summary of this function goes here
%   Detailed explanation goes here

    reviewers = zeros(N,N-1);

    for i=1:N
        r = randperm(N);
        self = find(r==i);
        if (self == 1) 
            r = r(2:N);
        elseif (self == N);
            r = r(1:N-1);
        else
            r = [r(1:self-1) r(self+1:N)];
        end
        reviewers(i,:) = r;
    end
        
end





        
