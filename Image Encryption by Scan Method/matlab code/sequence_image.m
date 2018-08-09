function res = sequence_image(size)
%   SEQUENCE_IMAGE(SIZE) returns a simple image matrix formed with sequence
%   of numbers starting from 1 as top left element all the way down to 
%   bottom right.
%   Its use is for debugging the encryption method.
%   e.g. SEQUENCE_IMAGE(4) will give
%       1   2   3   4
%       5   6   7   8
%       9   10  11  12
%       13  14  15  16

    val = 1;
    for i=1:size
        for j=1:size
            res(i,j) = val;
            val = val+1;
        end
    end
end