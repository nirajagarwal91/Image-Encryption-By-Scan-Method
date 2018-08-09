function res = preprocess_image(image)
%   PREPROCESS_IMAGE(IMAGE) preprocesses the image before it can be
%   encrypted
%   Step 1. It converts it to grayscale image.
%   Step 2. Grayscale image is converted to a square image by padding 0s
%           This will have effect of adding black space to image.

    %Step 1
    image = rgb2gray(image);
    
    %Step 2 is converting rectangular to square image as the concept works
    %only on square image
    
    %   1   2   3
    %   4   5   6
    %will be converted to 
    %   1   2   3
    %   4   5   6
    %   0   0   0
    
    %   1   2
    %   3   4
    %   5   6
    %will be converted to 
    %   1   2   0
    %   3   4   0
    %   5   6   0
    
    dimx = size(image,1);
    dimy = size(image,2);
    if dimx < dimy
        diff = dimy - dimx;
        temp = zeros(diff, dimy);
        res = [image; temp];
    else
        diff = dimx - dimy;
        temp = zeros(dimx,diff);
        res = [image temp];
    end
end