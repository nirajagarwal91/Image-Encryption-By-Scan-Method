function [a,b,c,d] = partition_in_four(image)
%   PARTITION_IN_FOUR(IMAGE) partitions image in four sub-images
%   e.g. if IMAGE is
%       1   2   3   4
%       5   6   7   8
%       9   10  11  12  
%       13  14  15  16
%   it will return A, B, C, D as
%   a
%       1   2
%       5   6
%   b
%       3   4
%       7   8
%   c
%       9   10
%       13  14
%   d
%       11  12
%       15  16

    sz = size(image,1);
    halfsz = sz/2;
    a = zeros(halfsz);
    b = a;
    c = a;
    d = a;
    a = image(1:halfsz, 1:halfsz);
    b = image(1:halfsz, halfsz+1:sz);
    c = image(halfsz+1:sz, 1:halfsz); 
    d = image(halfsz+1:sz, halfsz+1:sz);
end