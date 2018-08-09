function res = compute_correlation_grayscale(image, crypt_image)
%   COMPUTE_CORRELATION_GRAYSCALE(A, B) measures the correlation between 
%   2 grayscale image matrcies A and B according to the formula given in
%   the pdf and returns it.
%
%   If answer approaches 1, A and B are highly correlated as you can check
%   from the result of a trivial call 
%       COMPUTE_CORRELATION_GRAYSCALE(A, A)
%   answer will be 1
%   If answer approaches 0, A and B have minimum correlation.
%   0 correlation is the ideal value for two matrices if B is some
%   encrypted form of A.
%   So we want COMPUTE_CORRELATION_GRAYSCALE(IMAGE, CRYPTEDIMAGE) to be 0.

    %num saves the numerator
    num = 0.0;
    %den1 saves the first part of the denominator
    den1 = 0.0;
    %den2 saves the second part of the denominator
    den2 = 0.0;
    
    %means are calculated for both the images
    image_mean = sum(image(:)) / (size(image,1)*size(image,2));
    crypt_image_mean = sum(crypt_image(:)) / (size(image,1)*size(image,2));
    
    %matrices are converted to double from uint8 so that maths functions 
    %can work on them
    image = double(image);
    crypt_image = double(crypt_image);
    
    %addition implemented for every particular element
    for i = 1:size(image,1)
        for j = 1:size(image,2)
            num = num + ((image(i,j)-image_mean)*(crypt_image(i,j)...
                -crypt_image_mean));
            den1 = den1 + power((image(i,j)-image_mean),2);
            den2 = den2 + power((crypt_image(i,j)-crypt_image_mean),2);
        end
    end

    %final calculation
    den1 = sqrt(double(den1));
    den2 = sqrt(double(den2));
    res = double(num / (den1*den2));
    res = abs(res);
end