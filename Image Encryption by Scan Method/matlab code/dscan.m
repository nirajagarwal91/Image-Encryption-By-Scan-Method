function res = dscan(size)
%   DSCAN(SIZE) forms the Continuous Diagonal D scanning pattern which is a
%   square matrix of dimension SIZE as given in the call.
%   Result will have values starting from 1 at top left corner and then you
%   can trace the increasing numbers in the matrix to understand how the
%   scanning pattern is formed.
%   e.g. DSCAN(4) answer is 
%       1   2   6   7
%       3   5   8   13
%       4   9   12  14
%       10  11  15  16

    %concept again goes with the coordinates trick
    %lets look at the coordinates again going with increasing order of val
    %(1,1) (1,2) (2,1) (3,1) (2,2) (1,3) (1,4) (2,3) (3,2) (4,1) (4,2) 
    %(3,3) (2,4) (3,4) (4,3) (4,4)
    %again i will divide them in some logical parts
    %(1,1)
    %(1,2) (2,1)
    %(3,1) (2,2) (1,3)
    %(1,4) (2,3) (3,2) (4,1)
    %(4,2) (3,3) (2,4)
    %(3,4) (4,3) 
    %(4,4)
    %goto second part (1,2) (2,1)
    %we are coming down along a diagonal
    %i is incremented and j is decremented
    %if i had tried to go further after (2,1), result would have been (3,0)
    %but we need (3,1),i.e. the start of 3rd part
    %goto third part (3,1) (2,2) (1,3)
    %we are going up a diagonal
    %i is decremented and j is incremented
    %if i had tried to go further after (1,3), result would have been (0,4)
    %but we need (1,4),i.e. the start of 4th part
    %result - whenever your next predicted value has a 0,make it 1!
    %problem-4th part (4,1) will have next one (5,0) but we need (4,2)
    %so actual solution is
    %if next position has a 0 and the other corrdinate is in limit of given
    %size, make 0 1
    %if any next coordinate goes out of size, take your present coordinate
    % and add 1 to minimum coordinate of the two
    %e.g. at (4,1) next is (5,0) but 5>size so current is (4,1) increment 1
    %so, (4,1) is changed to (4,2)
    
    %down  'yes' will tell we have to do down a diagonal, up otherwise
    res = zeros(size);
    res(1,1) = 1;
    val = 2;
    i = 1;
    j = 2;
    down = 'yes';
    done = 'no';
    
    while strcmp(done,'no')
        res(i,j) = val;
        val = val+1;
        if strcmp(down,'yes')
            nexti = i+1;
            nextj = j-1;
        else
            nexti = i-1;
            nextj = j+1;
        end
        %to check if next positions are out of array
        if nexti <1 || nexti >size || nextj <1 || nextj >size
            
            %alternating down for next cycle
            %if you were going down a diagonal, now you have to go up a 
            %diagonal and vice-versa
            if strcmp(down,'yes')
                down = 'no';
            else
                down = 'yes';
            end

            %logic I had told earlier
            if nexti==0 && nextj<=size
                nexti = 1;
            elseif nextj==0 && nexti<=size
                nextj = 1;
            elseif i<j
                nexti = i+1;
                nextj = j;
            else
                nexti = i;
                nextj = j+1;
            end
        end
        if i==size && j==size
            done = 'yes';
        end
        i = nexti;
        j = nextj;
    end
end