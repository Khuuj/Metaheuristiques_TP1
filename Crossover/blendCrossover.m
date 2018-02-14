function children = blendCrossover(firstParent, secondParent, alpha)
    L = length(firstParent);
    firstChild = zeros(1, L);
    secondChild = zeros(1, L);
    
    for i = 1:L
        delta = abs(firstParent(i) - secondParent(i));
        % x1 must be the biggest of (x1,x2)
        % x2 the smallest 
        x1 = min(firstParent(i), secondParent(i));
        x2 = max(firstParent(i), secondParent(i));
        firstChild(i) = random((x1 - alpha*delta),(x2 + alpha*delta));
        secondChild(i) = random((x1 - alpha*delta),(x2 + alpha*delta));
    end
    
    children = [firstChild ; secondChild];
end

function x = random(a, b)
    x = a + (b-a)*rand;
end