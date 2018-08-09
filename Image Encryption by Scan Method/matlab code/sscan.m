function res = sscan(size)
%   SSCAN(SIZE) forms the Spiral S scanning pattern which is a
%   square matrix of dimension SIZE as given in the call.
%   Result will have values starting from 1 at top left corner and then you
%   can trace the increasing numbers in the matrix to understand how the
%   scanning pattern is formed.
%   e.g. SSCAN(4) answer is 
%       1   2   3   4
%       12  13  14  5
%       11  16  15  6
%       10  9   8   7

    %initialization
    res = zeros(size);
    i=1;
    j=1;
    direction = 'e';
    done = 'no';
    val = 1;
    
    %concept used is a bit of gaming like pacman
    %we will start from top left, our direction set is 'e' i.e. east so we
    %will keep moving to right and when we reach the end of matrix or the 
    %next calculated value is already filled with some value, we will turn 
    %right (i.e. to south direction in this case) and again start moving.
    %e.g. of end of matrix is when you are at 4 in the above example.
    %e.g. of next value already filled is when you are at 12, 1 is already
    %filled.
    
    %done keeps track of whether pattern has been completed or not.
    %done is set 'yes' when positions forward to you and right to you, both
    %are filled!
    %e.g. when you are at 16, 11 is filled and 13 is also filled, so
    %mission accomplished.
    
    while strcmp(done,'no')
        res(i,j) = val;
        val = val+1;
        
        %next position is calculated in same direction
        [nexti,nextj] = forward(i,j,direction);
        
        %to check if next position is out of matrix bound or already filled
        if nexti == 0 || nextj == 0 || nexti >size || nextj >size ||...
                res(nexti,nextj) ~= 0
            
            %next position calculated after turning right
            [nexti,nextj,direction] = turn_right(i,j,direction);
            
            %if this position also filled, we are done.
            if res(nexti,nextj) ~= 0
                done='yes';
            end
        end
        i = nexti;
        j = nextj;
    end
end

function [nexti,nextj] = forward(i,j, direction)
    switch direction
        case 'e'
            nextj = j+1;
            nexti = i;
        case 'w'
            nextj = j-1;
            nexti = i;
        case 's'
            nexti = i+1;
            nextj = j;
        case 'n'
            nexti = i-1;
            nextj = j;
    end
end

function [nexti,nextj,new_direction] = turn_right(i,j, direction)
    switch direction
        case 'e'
            nexti = i+1;
            nextj = j;
            new_direction = 's';
        case 'w'
            nexti = i-1;
            nextj = j;
            new_direction = 'n';
        case 's'
            nextj = j-1;
            nexti = i;
            new_direction = 'w';
        case 'n'
            nextj = j+1;
            nexti = i;
            new_direction = 'e';
    end
end