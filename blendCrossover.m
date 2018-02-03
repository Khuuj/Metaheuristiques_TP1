function children = blendCrossover(firstParent, secondParent, alpha)
    L = length(firstParent);
    firstChild = zeros(1, L);
    secondChild = zeros(1, L);
    
    for i = 1:L
        delta = abs(firstParent(i) - secondParent(i));
        x1 = min(firstParent(i), secondParent(i));
        x2 = max(firstParent(i), secondParent(i));
        firstChild(i) = rand((x1 - alpha*delta),(x2 + alpha*delta));
        secondChild(i) = rand((x1 - alpha*delta),(x2 + alpha*delta));
    end
    
    children = [firstChild ; secondChild];
end