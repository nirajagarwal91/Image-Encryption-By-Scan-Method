function res = image_array_back(crypted, scan)
%   IMAGE_ARRAY_BACK(CRYPTED, SCAN) gives the original 1-D array back which
%   was crypted by scanning with SCAN
%   say A = [5 0 3 4] was crypted by SCAN to CRYPTED, then this function 
%   gives back A

    %suppose A was [5 0 3 4], SCAN was [2 3 1 4]
    %so CRYPTED is [0 3 5 4]
    %i.e. SCAN(1) is 2 telling CRYPTED(1) has to be 2nd element of A i.e. 0
    
    %we want to return A as res
    %we know that 1st element of CRYPTED is actually 2nd element of A
    %so we will save 1st element of CRYPTED at 2nd position of res
    %i.e. res(2) = crypted(1)
    %this 2 is nothing but scan(1)
    %so, res(scan(1)) = crypted(1)
    sz = size(crypted,2);
    for i =1:sz
        res(scan(1,i)) = crypted(i); 
    end
end