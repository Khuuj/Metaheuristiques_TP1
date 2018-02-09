function children = crossover(crossoverFunction, matingPool, pc, L, alpha)
M = size(matingPool,1);
perm = randperm(M);
children = zeros(M, L);
childpeer = zeros(2, L);
i = 1;
for n = 1:(M/2)
%     disp("next round : line " + perm(i) + " & " + perm(i+1));
    firstParent = matingPool(perm(i),:);
    secondParent = matingPool(perm(i+1),:);
    prob = rand;
    if (prob <= pc )
        childpeer = crossoverFunction(firstParent, secondParent, alpha);
    end
    children(i,:) = childpeer(1,:);
    children(i+1,:) = childpeer(2,:);
    i= i + 2;
end

% If M is an odd number, the last chromosome is added without crossover
if (mod(M,2))
    children(M,:) = matingPool(perm(M),:);
end   
end

