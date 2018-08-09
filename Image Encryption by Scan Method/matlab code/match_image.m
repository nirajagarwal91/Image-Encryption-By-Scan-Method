function res = match_image(image1,image2)
%   MATCH_IMAGE(IMAGE1, IMAGE2) matches IMAGE1 and IMAGE2.
%   It returns 0 if any corresponding element in both mismatch, 1 otherwise
%   Used to check if decrypted image matches the original image completely
%   or not.

    res =1;
    for i=1:size(image1,1)
        for j=1:size(image1,2)
            if image1(i,j) ~= image2(i,j)
                res = 0;
            end
        end
    end
end