function res = image_to_onedarray(image)
%   IMAGE_TO_ONEDARRAY(IMAGE) converts IMAGE 2-D matrix to row major 1-D
%   matrix
%   e.g.
%   if IMAGE is 
%       1   2
%       3   4
%   answer is
%       1   2   3   4
    
    %reshape(A,x,y) converts A matrix to x*y size but in column major mode
    %so needs to be transposed before
    res = reshape(image(:,:)',1,size(image,1)*size(image,2));
end