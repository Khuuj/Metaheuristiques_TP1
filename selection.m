function matingPool = selection(scoresi, M, L, popi, selectionFunction)
matingPool = zeros(M,L);
for i=1:M
      indice = selectionFunction(scoresi);
      matingPool(i, :) = popi(indice, :);
end
end
