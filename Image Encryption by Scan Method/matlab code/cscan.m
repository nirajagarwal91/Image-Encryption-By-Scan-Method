function res = cscan(size)
%   CSCAN(SIZE) forms the Continuous Rasters C scanning pattern which is a
%   square matrix of dimension SIZE as given in the call.
%   Result will have values starting from 1 at top left corner and then you
%   can trace the increasing numbers in the matrix to understand how the
%   scanning pattern is formed.
%   e.g. CSCAN(4) answer is 
%       1   2   3   4
%       8   7   6   5
%       9   10  11  12
%       16  15  14  13

    %initialization
    res = zeros(size);
    i=1;
    j=1;
    val=1;
    
    %as seen from the cscan(4) output, odd row has addition of 1 going 
    %from left to right while, even row has addition of 1 from right to
    %left.
    %left to right means column counter will be incremented (j in our case)
    %right to left means column counter will be decremented.
    %operation variable keeps track of this.
    %'add' means j has to be incremented, while 'subtract' means it has to 
    %be decremented.
    operation = 'add';
    
    while i<=size 
        %assigning value to the matrix element and then incrementing value 
        %for next time
        res(i,j) = val;
        val = val+1;
        
        if strcmp(operation,'add')
            j = j+1;
            %if j goes out of array, it means this row is full, we have to
            %shift down to next row and operation has to be alternated.
            if j>size
                i=i+1;
                j=size;
                operation = 'subtract';
            end
        else
            j = j-1;
            if j==0
                i=i+1;
                j=1;
                operation = 'add';
            end
        end
    end
end
