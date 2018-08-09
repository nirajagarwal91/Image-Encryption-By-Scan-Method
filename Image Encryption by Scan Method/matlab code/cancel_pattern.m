function res = cancel_pattern(image, base_pattern_type, base_rotation,key)
%   CANCEL_PATTERN(IMAGE, BASE_PATTERN_TYPE, BASE_ROTATION, KEY) is the 
%   heart of the project at receiving end.
%   It will divide image into 4 sub-images.
%   If key is non-empty, it will divide the key into 4 parts.
%   If the part is a scan_key, then that corresponding sub-image will be
%   sent for getting original sub-image according to the sub-key.
%   If the part is a pattern_key, then that corresponding sub-image will be
%   sent for cancelling the pattern according to the pattern_key.
%   It will generate a pattern depending upon PATTERN_TYPE which can be
%   {B,Z,X} and then rotate it according to ROTATION which can range from 0
%   to 7.
%   Then depending upon the pattern generated, arrange these sub-images.
%
%   *************IMPORTANT THING TO REMEMBER***********
%   In ARRANGE_BY_PATTERN(), first sub-images were arranged according to
%   pattern and then sub-images were processed by the key.
%   Here, sub-images are processed by key and then sub-images are regained
%   by cancelling the pattern.

    %division of image into 4 sub-images
    %read pattern_in_four() for more details.
    [a,b,c,d] = partition_in_four(image);
    
    %working same as in arrange_by_pattern()
    if strcmp(key,'') ~= 1
        [k1,k2,k3,k4] = four_keys_out(key);
        switch(k1(1))
            case {'B','Z','X'}
                [pattern_key, left_key] = pattern_key_out(k1);
                [pattern_type, rotation] = alnum_separate(pattern_key);
                a = cancel_pattern(a, pattern_type, rotation,...
                    left_key);
            case {'o','s','d','c'}
                [pattern_type, rotation] = alnum_separate(k1);
                a = descan_image(a, pattern_type, rotation);
        end
        switch(k2(1))
            case {'B','Z','X'}
                [pattern_key, left_key] = pattern_key_out(k2);
                [pattern_type, rotation] = alnum_separate(pattern_key);
                b = cancel_pattern(b, pattern_type, rotation,...
                    left_key);
            case {'o','s','d','c'}
                [pattern_type, rotation] = alnum_separate(k2);
                b = descan_image(b, pattern_type, rotation);
        end
        switch(k3(1))
            case {'B','Z','X'}
                [pattern_key, left_key] = pattern_key_out(k3);
                [pattern_type, rotation] = alnum_separate(pattern_key);
                c = cancel_pattern(c, pattern_type, rotation,...
                    left_key);
            case {'o','s','d','c'}
                [pattern_type, rotation] = alnum_separate(k3);
                c = descan_image(c, pattern_type, rotation);
        end
        switch(k4(1))
            case {'B','Z','X'}
                [pattern_key, left_key] = pattern_key_out(k4);
                [pattern_type, rotation] = alnum_separate(pattern_key);
                d = cancel_pattern(d, pattern_type, rotation,...
                    left_key);
            case {'o','s','d','c'}
                [pattern_type, rotation] = alnum_separate(k4);
                d = descan_image(d, pattern_type, rotation);
        end
    end
    
    %generation of pattern and rotation
    %read pattern_generate() for more details
    pattern = pattern_generate(base_pattern_type, base_rotation);
    
    %cancelling the pattern
    %same working as descan_image()
    %let pattern is 
    %   2   3
    %   4   1
    %we have
    %   a   b
    %   c   d
    %we want to get back the original
    %pattern has first element 2
    %so, we know that actually second of original image was asked to come
    %at this position
    %so, newb = a;
    
    switch(pattern(1,1))
        case 1
            newa = a;
        case 2
            newb = a;
        case 3
            newc = a;
        case 4
            newd = a;
    end    
    switch(pattern(1,2))
        case 1
            newa = b;
        case 2
            newb = b;
        case 3
            newc = b;
        case 4
            newd = b;
    end    
    switch(pattern(2,1))
        case 1
            newa = c;
        case 2
            newb = c;
        case 3
            newc = c;
        case 4
            newd = c;
    end    
    switch(pattern(2,2))
        case 1
            newa = d;
        case 2
            newb = d;
        case 3
            newc = d;
        case 4
            newd = d;
    end

    %final result generation
    res = [newa newb; newc newd];
end