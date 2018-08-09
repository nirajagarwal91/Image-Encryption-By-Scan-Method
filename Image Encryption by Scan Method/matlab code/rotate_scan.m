function res = rotate_scan(matrix, rotation)
%   ROTATE_SCAN(MATRIX, ROTATION) rotates given MATRIX depending upon
%   ROTATION which can range from 0 to 7
%   suppose matrix is
%       1   2
%       3   4
%   ROTATION = 0 means the matrix itself, no rotation
%   ROTATION = 1 means matrix is flipped along x axis
%       3   4
%       1   2
%   ROTATION = 2 means matrix has to be rotated by 90 degrees anticlockwise
%       2   4
%       1   3
%   ROTATION = 3 means matrix after ROTATION = 2 is flipped along y axis
%       4   2
%       3   1
%   ROTATION = 4 means matrix has to be rotated by 180 degrees
%   anticlockwise
%       4   3
%       2   1
%   ROTATION = 5 means matrix after ROTATION = 4 is flipped along x axis
%       2   1
%       4   3
%   ROTATION = 6 means matrix has to be rotated by 270 degrees
%   anticlockwise
%       3   1
%       4   2
%   ROTATION = 7 means matrix after ROTATION = 6 is flipped along y axis
%       1   3
%       2   4

    switch rotation
        case 0
            res = matrix;
        case 1
            res = fliplr(matrix')';
        case 2
            res = fliplr(matrix)';
        case 3
            res = fliplr(fliplr(matrix)');
        case 4
            res = fliplr(fliplr(matrix)')';
        case 5
            res = fliplr(matrix);
        case 6
            res = fliplr(matrix');
        case 7
            res = matrix';    
end