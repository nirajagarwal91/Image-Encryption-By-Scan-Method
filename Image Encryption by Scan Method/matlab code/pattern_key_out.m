function [pattern_key, left_key] = pattern_key_out(key)
%   PATTERN_KEY_OUT(KEY) separates pattern_key and left out part from a key
%   e.g. if key is
%       B2(o5,d2,s1,c7)
%   It will return PATTERN_KEY as B2
%   and LEFT_KEY as o5,d2,s1,c7

    pos = strfind(key, '(');
    %pos will save all positions of ( in the key
    %we need only first one
    %so taking only pos(1,1)
    stop = pos(1,1);
    
    %key from its start before stop will be PATTERN_KEY
    i = 1;
    while(i<stop)
        pattern_key(i) = key(i);
        i = i+1;
    end

    %i is incremented to skip this opening bracket (
    i = i+1;
    
    %now starting from i upto the end of the key leaving last closing 
    %bracket ) will be LEFT_KEY
    j = 1;
    while(i<length(key))
        left_key(j) = key(i);
        i = i+1;
        j = j+1;
    end
end