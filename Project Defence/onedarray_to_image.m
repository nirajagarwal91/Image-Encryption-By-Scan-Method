function res = onedarray_to_image(one_dim_array)
    image_dim = sqrt(length(one_dim_array));
    count = 1;
    for i =1:image_dim
        for j =1:image_dim
            res(i,j) = one_dim_array(count);
            count = count+1;
        end
    end
end