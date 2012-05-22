%myDate = java.util.Date;
%myDate

a = [1:100];
rr = permute_reviewers(100);
while (check_reviewer_permutations(rr) == 0)
    rr = permute_reviewers(a, 3);
end

% rr
% c = count_reviewers(rr);
% c

rr3 = rr(:,1:3);
c = count_reviewers(rr3);
% c

mean(c)
var(c)

%hist(rr)
