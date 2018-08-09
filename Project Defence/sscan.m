function res = sscan(size)
    res = zeros(size);
    i=1;
    j=1;
    direction = 'e';
    done = 'no';
    val = 1;

    while strcmp(done,'no')
        res(i,j) = val;
        val = val+1;
        
        [nexti,nextj] = forward(i,j,direction);
        
        if nexti == 0 || nextj == 0 || nexti >size || nextj >size ||...
                res(nexti,nextj) ~= 0
            
            [nexti,nextj,direction] = turn_right(i,j,direction);
            
            if res(nexti,nextj) ~= 0
                done='yes';
            end
        end
        i = nexti;
        j = nextj;
    end
end

function [nexti,nextj] = forward(i,j, direction)
    switch direction
        case 'e'
            nextj = j+1;
            nexti = i;
        case 'w'
            nextj = j-1;
            nexti = i;
        case 's'
            nexti = i+1;
            nextj = j;
        case 'n'
            nexti = i-1;
            nextj = j;
    end
end

function [nexti,nextj,new_direction] = turn_right(i,j, direction)
    switch direction
        case 'e'
            nexti = i+1;
            nextj = j;
            new_direction = 's';
        case 'w'
            nexti = i-1;
            nextj = j;
            new_direction = 'n';
        case 's'
            nextj = j-1;
            nexti = i;
            new_direction = 'w';
        case 'n'
            nextj = j+1;
            nexti = i;
            new_direction = 'e';
    end
end