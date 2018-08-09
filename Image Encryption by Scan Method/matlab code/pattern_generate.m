function pattern = pattern_generate(pattern_type, rotation)
%   PATTERN_GENERATE(PATTERN_TYPE, ROTATION) generates the pattern 
%   according to the PATTERN_TYPE which can be {'B','Z','X'} and rotates it 
%   according to ROTATION which can range from 0 to 7.

    switch pattern_type
        case 'B'
            pattern = [1 2; 4 3];
        case 'Z'
            pattern = [1 2; 3 4];
        case 'X'
            pattern = [1 3; 4 2];
    end
    pattern = rotate_scan(pattern, rotation);
end