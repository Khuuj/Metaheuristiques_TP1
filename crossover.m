function children = crossover(matingPool, pc, N, L, crossoverFunction)
perm = randperm(N);
children = zeros(N, L);
i = 1;
for n = 1:(N/2)
%     disp("next round : line " + perm(i) + " & " + perm(i+1));
    firstChild = matingPool(perm(i),:);
    secondChild = matingPool(perm(i+1),:);
    prob = rand;
    if (prob > pc )
        crossoverFunction(N, L, firstChild, secondChild);
    end
    children(i,:) = firstChild;
    children(i+1,:) = secondChild;
    i= i + 2;
end
end

