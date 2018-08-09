function res = decrypt_image(image,key)
%   DECRYPT_IMAGE(IMAGE, KEY) is the boss at receiving end.
%   It will return the decrypted image of IMAGE according to the KEY you
%   mention.

    %key will be separated to pattern_key and left_key 
    %read pattern_key_out() for more details
    [pattern_key, left_key] = pattern_key_out(key);
    
    %alphabet and number will be separated from pattern_key
    %read alnum_separate() for more details
    [pattern_type, rotation] = alnum_separate(pattern_key);
    
    %cancel_pattern() is a recursive function called once here
    %rest it will do itself
    %read cancel_pattern() for more details
    res = cancel_pattern(image, pattern_type, rotation, left_key);
end