function res = arrange_by_pattern(image, pattern_type, rotation, key)
%   ARRANGE_BY_PATTERN(IMAGE, PATTERN_TYPE, ROTATION, KEY) is the heart of
%   the project.
%   It will generate a pattern depending upon PATTERN_TYPE which can be
%   {B,Z,X} and then rotate it according to ROTATION which can range from 0
%   to 7.
%   Then it will divide image into 4 sub-images and depending upon the
%   pattern generated, arrange these sub-images.
%   If key is '' i.e. empty, it will return this result.
%   Otherwise, it will divide the key into 4 parts.
%   If the part is a scan_key, then that corresponding sub-image will be
%   sent for shuffling according to the sub-key.
%   If the part is a pattern_key, then that corresponding sub-image will be
%   sent for arranging according to the pattern_key.
    
    %division of image into 4 sub-images
    %read pattern_in_four() for more details.
    [a,b,c,d] = partition_in_four(image);
    
    %generation of pattern and rotation
    %read pattern_generate() for more details
    pattern = pattern_generate(pattern_type, rotation);
    
    %arranging of sub-images according to pattern
    %same as scan_image
    %let image has sub-images as 
    %   a   b
    %   c   d
    %let pattern is 
    %   2   3
    %   4   1
    %pattern will look at its first element. It is 2
    %so b is asked to become newa
    %so on, the result will be
    %   b   c
    %   d   a
    switch(pattern(1,1))
        case 1
            newa = a;
        case 2
            newa = b;
        case 3
            newa = c;
        case 4
            newa = d;
    end    
    switch(pattern(1,2))
        case 1
            newb = a;
        case 2
            newb = b;
        case 3
            newb = c;
        case 4
            newb = d;
    end    
    switch(pattern(2,1))
        case 1
            newc = a;
        case 2
            newc = b;
        case 3
            newc = c;
        case 4
            newc = d;
    end    
    switch(pattern(2,2))
        case 1
            newd = a;
        case 2
            newd = b;
        case 3
            newd = c;
        case 4
            newd = d;
    end
    
    %to go further if key is not empty
    if strcmp(key,'') ~= 1
        %divide in four keys
        %read four_keys_out() for more details
        [k1,k2,k3,k4] = four_keys_out(key);
        
        %if key is pattern_key, arrange_by_pattern() will be called
        %if key is scan_key, scan_image() will be called
        switch(k1(1))
            case {'B','Z','X'}
                [pattern_key, left_key] = pattern_key_out(k1);
                [pattern_type, rotation] = alnum_separate(pattern_key);
                newa = arrange_by_pattern(newa, pattern_type, rotation,...
                    left_key);
            case {'o','s','d','c'}
                [pattern_type, rotation] = alnum_separate(k1);
                newa = scan_image(newa, pattern_type, rotation);
        end
        switch(k2(1))
            case {'B','Z','X'}
                [pattern_key, left_key] = pattern_key_out(k2);
                [pattern_type, rotation] = alnum_separate(pattern_key);
                newb = arrange_by_pattern(newb, pattern_type, rotation,...
                    left_key);
            case {'o','s','d','c'}
                [pattern_type, rotation] = alnum_separate(k2);
                newb = scan_image(newb, pattern_type, rotation);
        end
        switch(k3(1))
            case {'B','Z','X'}
                [pattern_key, left_key] = pattern_key_out(k3);
                [pattern_type, rotation] = alnum_separate(pattern_key);
                newc = arrange_by_pattern(newc, pattern_type, rotation,...
                    left_key);
            case {'o','s','d','c'}
                [pattern_type, rotation] = alnum_separate(k3);
                newc = scan_image(newc, pattern_type, rotation);
        end
        switch(k4(1))
            case {'B','Z','X'}
                [pattern_key, left_key] = pattern_key_out(k4);
                [pattern_type, rotation] = alnum_separate(pattern_key);
                newd = arrange_by_pattern(newd, pattern_type, rotation,...
                    left_key);
            case {'o','s','d','c'}
                [pattern_type, rotation] = alnum_separate(k4);
                newd = scan_image(newd, pattern_type, rotation);
        end
    end

    %final result generation
    res = [newa newb;newc newd];
end