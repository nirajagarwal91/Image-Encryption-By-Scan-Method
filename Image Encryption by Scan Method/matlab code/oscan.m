function res = oscan(size)
%   OSCAN(SIZE) forms the Continuous Orthogonal O scanning pattern which is
%    a square matrix of dimension SIZE as given in the call.
%   Result will have values starting from 1 at top left corner and then you
%   can trace the increasing numbers in the matrix to understand how the
%   scanning pattern is formed.
%   e.g. OSCAN(4) answer is 
%       1   2   9   10
%       4   3   8   11
%       5   6   7   12
%       16  15  14  13

    %concept is a little tricky
    %just trace the position coordinates of the values in increasing order
    %you will get (1,1) (1,2) (2,2) (2,1) (3,1) (3,2) (3,3) (2,3) (1,3)
    %(1,4) (2,4) (3,4) (4,4) (4,3) (4,2) (4,1)
    %i will divide these position coordinates in 4 parts just have a look
    %   (1,1)
    %   (1,2) (2,2) (2,1)
    %   (3,1) (3,2) (3,3) (2,3) (1,3)
    %   (1,4) (2,4) (3,4) (4,4) (4,3) (4,2) (4,1)
    %look at 2nd part (1,2) (2,2) (2,1)
    %first i is incremented till both i and j are equal and then j is
    %decremented back to 1
    %look at 3rd part (3,1) (3,2) (3,3) (2,3) (1,3)
    %first j is incremented till both i and j are equal and then i is
    %decremented back to 1
    %again in 4th part i is incremented and then j is decremented.
    %this is the concept!
    
    %initialization
    res = zeros(size);
    i =1;
    j =2;
    
    %if which_to_change is 1, processing will be done on i
    %else on j
    which_to_change =1;
    
    %up ='yes' tells the counter is to be incremented, else decremented
    up ='yes';
    done = 'no';
    
    %res(1,1) is not taken in logic, its values is set at start only
    res(1,1) =1;
    
    res(1,2) =2;
    value = 2;
    
    while strcmp(done,'no')
        res(i,j) = value;
        value = value + 1;
        if strcmp(up,'yes')
            %if both counters are same, up and which_to_change have to be 
            %alternated
            if i==j
                up = 'no';
                if which_to_change == 1
                    j = j-1;
                    which_to_change = 2;
                else
                    i = i-1;
                    which_to_change = 1;
                end
            %incrementing the counter depending upon which_to_change
            elseif which_to_change == 1
                i = i+1;
            else
                j = j+1;
            end
        
        else
            %if size is suppose 5, then if you have reached to (1,5) or 
            %(5,1), you are done
            if (i==1 && j==size) || (j==1 && i==size)
                done = 'yes';
            
            %if you have come to (2,1) now you have to go to next section
            %i.e (3,1)
            %or if you are at (1,3), now (1,4)
            elseif i==1
                j = j+1;
                up = 'yes';
            elseif j==1
                i =i+1;
                up = 'yes';
            
            %decrementing the counter depending upon which_to_change
            elseif which_to_change==1
                i = i-1;
            else
                j = j-1;
            end
        end
    end
end