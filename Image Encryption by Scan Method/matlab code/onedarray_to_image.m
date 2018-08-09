function res = onedarray_to_image(one_dim_array)
%   ONEDARRAY_TO_IMAGE(ONE_DIM_ARRAY) converts row major ONE_DIM_ARRAY to
%   2-D image matrix
%   e.g.
%   if ONE_DIM_ARRAY is
%       1   2   3   4
%   answer is
%       1   2
%       3   4
    image_dim = sqrt(length(one_dim_array));
    count = 1;
    for i =1:image_dim
        for j =1:image_dim
            res(i,j) = one_dim_array(count);
            count = count+1;
        end
    end
end