function [alpha,num] = alnum_separate(str)
%   ALNUM_SEPARATE(STR) separates alphabet and number from STR and return
%   them.
%   e.g. ALNUM_SEPARATE('B3') will return 'B' and 3.

    alpha = str(1);
    num = str(2) - '0';
end