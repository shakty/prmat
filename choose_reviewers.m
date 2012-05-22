function reviewers = choose_reviewers( agents, NR )
%CHOOSE_REVIEWER Summary of this function goes here
%   Detailed explanation goes here

    A = numel(agents);
    reviewers = zeros(A,NR);
    invalid = zeros(1,A);
    idx_invalid = 1;
    control = zeros(1,A);
    
    for i=1:(A*NR)
        
        i = mod(i,A)
        j = mod(i,NR)
        
        idx = randi(A,1);
        while (i == idx || any(reviewers(i,:) == idx) || any(invalid == idx))
            idx = randi(A,1);
        end
        reviewers(i,j) = idx;

        control(reviewers(i,j)) = control(reviewers(i,j)) + 1;
        if (control(reviewers(i,j)) == NR)
            invalid(idx_invalid) = reviewers(i,j);
            idx_invalid = idx_invalid + 1;
        end
           
        
        if (idx_invalid > (A - i))
           display('WRONG');
           break;
        end
    end
   
    % VERIFY THE MATRIX
    
    control
    
%     for i=1:A    
%         control(i);
%         if (control(i) ~= NR)
%             display(['ERROR' control(i)]);
%         end
%     end
   
    
end


% function reviewers = choose_reviewers( agents, NR )
% %CHOOSE_REVIEWER Summary of this function goes here
% %   Detailed explanation goes here
% 
%     A = numel(agents);
%     reviewers = zeros(A,NR);
%     invalid = zeros(1,A);
%     idx_invalid = 1;
%     control = zeros(1,A);
%     
%     for i=1:A    
%         for j=1:NR
%             idx = randi(A,1);
%             while (i == idx || any(reviewers(i,:) == idx) || any(invalid == idx))
%                 idx = randi(A,1);
%             end
%             reviewers(i,j) = idx;
%             
%             control(reviewers(i,j)) = control(reviewers(i,j)) + 1;
%             if (control(reviewers(i,j)) == NR)
%                 invalid(idx_invalid) = reviewers(i,j);
%                 idx_invalid = idx_invalid + 1;
%             end
%            
%         end
%         if (idx_invalid > (A - i))
%            display('WRONG');
%            break;
%         end
%     end
%    
%     % VERIFY THE MATRIX
%     
%     control
%     
% %     for i=1:A    
% %         control(i);
% %         if (control(i) ~= NR)
% %             display(['ERROR' control(i)]);
% %         end
% %     end
%    
%     
% end

