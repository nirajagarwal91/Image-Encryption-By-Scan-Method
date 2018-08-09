function res = scan_image(image, scan_type, rotation)
%   SCAN_IMAGE(IMAGE, SCAN_TYPE, ROTATION) develop scanning pattern by
%   SCAN_TYPE which can be {'o','c','d','s'}, rotates it according to
%   ROTATION which can range from 0 to 7 and then shuffle IMAGE pixels
%   according to this scan pattern generated.

    %generation of scan and rotation
    switch scan_type
        case 'd'
            scan = rotate_scan(dscan(size(image,1)),rotation);
        case 'o'
            scan = rotate_scan(oscan(size(image,1)),rotation);
        case 's'
            scan = rotate_scan(sscan(size(image,1)),rotation);
        case 'c'
            scan = rotate_scan(cscan(size(image,1)),rotation);
    end

    %shuffling will be done in 1-D, so image and scan have to be first 
    %converted to 1-D 
    scan_one = image_to_onedarray(scan);
    image_one = image_to_onedarray(image);
    
    %this code shuffles image_one according to scan_one
    %scan_one sees in it the number and asks that numbered element from 
    %image_one to come at this place
    %e.g. image_one is [3 5 1 2], scan is [2 1 4 3]
    %scan sees in it 2 at first position, so asks 2nd element of image_one
    %i.e. 5 to come at first position of res_one
    %so res_one will be [5 3 2 1]
    res_one = image_one(scan_one);
    
    %1-D res_one converted back to 2-D res
    res = onedarray_to_image(res_one);
end