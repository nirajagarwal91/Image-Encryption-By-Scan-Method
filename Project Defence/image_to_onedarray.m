function res = image_to_onedarray(image)
    res = reshape(image(:,:)',1,size(image,1)*size(image,2));
end