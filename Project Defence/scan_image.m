function res = scan_image(image, scan_type, rotation)
    
    scan = rotate_scan(sscan(size(image,1)),rotation);
    scan_one = image_to_onedarray(scan);
    image_one = image_to_onedarray(image);
    res_one = image_one(scan_one);
    res = onedarray_to_image(res_one);
end