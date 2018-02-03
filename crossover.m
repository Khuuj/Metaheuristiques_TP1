function children = crossover(matingPool, pc, N, L, crossoverFunction)
perm = randperm(N);
children = zeros(N, L);
i = 1;
for n = 1:(N/2)
%     disp("next round : line " + perm(i) + " & " + perm(i+1));
    firstParent = matingPool(perm(i),:);
    secondParent = matingPool(perm(i+1),:);
    prob = rand;
    if (prob <= pc )
        children = crossoverFunction(firstParent, secondParent);
    end
    i= i + 2;
end
end

