function res = get_original_image(matrix, size)
%   GET_ORIGINAL_IMAGE(MATRIX, SIZE) removes all padded 0s from square
%   matrix and converts it back to SIZE of original image done at the end
%   of decryption process.
    
    res = matrix(1:size(1), 1:size(2));
end