function [k1,k2,k3,k4] = four_keys_out(key)
%   FOUR_KEYS_OUT(KEY) returns 4 parts of the key detected by commas.
%   e.g. FOUR_KEYS_OUT('o3,s2,d5,c7') will return 'o3','s2','d5','c7'.

    key_count = 1;
    k1='';
    k2='';
    k3='';
    k4='';
    
    %we can easily partition 4 parts from o3,s2,d5,c7
    %but what if key is o3,X2(o2,d2,s1,c6),d5,c7
    %we can't go out to detect just comma 
    %solution is once you meet (, stop tracking for comma until ) comes
    %this we implement as problem variable started as 0
    %it will increment as it sees ( and decrement as it sees )
    %we can count , only when problem is 0
    
    i = 1;
    problem = 0;
    while(1)
        if key(key_count) == ',' && problem == 0
            break;
        elseif key(key_count) == '('
            problem = problem+1;
        elseif key(key_count) == ')'
            problem = problem-1;
        end
        k1(i) = key(key_count);
        i = i+1;
        key_count = key_count+1;
    end

    key_count = key_count+1;
    i = 1;
    problem = 0;
    while(1)
        if key(key_count) == ',' && problem == 0
            break;
        elseif key(key_count) == '('
            problem = problem+1;
        elseif key(key_count) == ')'
            problem = problem-1;
        end
        k2(i) = key(key_count);
        i = i+1;
        key_count = key_count+1;
    end
    
    key_count = key_count+1;
    i = 1;
    problem = 0;
    while(1)
        if key(key_count) == ',' && problem == 0
            break;
        elseif key(key_count) == '('
            problem = problem+1;
        elseif key(key_count) == ')'
            problem = problem-1;
        end
        k3(i) = key(key_count);
        i = i+1;
        key_count = key_count+1;
    end
    
    key_count = key_count+1;
    i = 1;
    problem = 0;
    while(key_count<=length(key))
        if key(key_count) == ',' && problem == 0
            break;
        elseif key(key_count) == '('
            problem = problem+1;
        elseif key(key_count) == ')'
            problem = problem-1;
        end
        k4(i) = key(key_count);
        i = i+1;
        key_count = key_count+1;
    end
end