function popg = testFeasibility(feasibilityFunction, popg, lower, upper, binary)
    % This function assures that no chromosome has a composant that does not respect the requirement
    % after a variation operation
    N = size(popg, 1);
    L = size(popg, 2);
    for i=1:N
        x = popg(i,1:L/2);
        y = popg(i,(L/2)+1:L);
        if (binary)
            x = decode(x,L/2,lower(1),upper(1));
            y = decode(y,L/2,lower(2),upper(2));
        end
        x = feasibilityFunction(x, lower(1), upper(1));
        y = feasibilityFunction(y, lower(2), upper(2));
        if (binary)
            x = encode(x,L/2,lower(1),upper(1));
            y = encode(y,L/2,lower(2),upper(2));
        end
        popg(i,1:L/2) = x;
        popg(i,(L/2)+1:L) = y;
    end
end