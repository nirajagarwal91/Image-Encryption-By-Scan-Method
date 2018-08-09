function res = descan_image(crypt_image, scan_type, rotation)
%   DESCAN_IMAGE(CRYPT_IMAGE, SCAN_TYPE, ROTATION) develop scanning pattern
%   by SCAN_TYPE which can be {'o','c','d','s'}, rotates it according to
%   ROTATION which can range from 0 to 7 and then converts CRYPT_IMAGE back
%   to ORIGINAL_IMAGE which was shuffled according to scan pattern.

    %generation of scan and rotation
    switch scan_type
        case 'd'
            scan = rotate_scan(dscan(size(crypt_image,1)),rotation);
        case 'o'
            scan = rotate_scan(oscan(size(crypt_image,1)),rotation);
        case 's'
            scan = rotate_scan(sscan(size(crypt_image,1)),rotation);
        case 'c'
            scan = rotate_scan(cscan(size(crypt_image,1)),rotation);
    end
    
    %processing will be done in 1-D, so image and scan have to be first 
    %converted to 1-D 
    scan_one = image_to_onedarray(scan);
    crypt_image_one = image_to_onedarray(crypt_image);
    
    %res_one saves the original image array which was crypted to 
    %crypt_image_one by scan_one
    %read image_array_back() for its functioning.
    res_one = image_array_back(crypt_image_one, scan_one);
    
    %1-D res_one converted back to 2-D res
    res = onedarray_to_image(res_one);
end