function res = rotate_scan(matrix, rotation)
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
end