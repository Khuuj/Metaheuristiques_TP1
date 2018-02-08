function matingPool = selection(scoresi, M, L, popi, selectionFunction)
matingPool = zeros(M,L);
indices = selectionFunction(M, scoresi);
for i=1:M
      %disp(popi(indices(i), :));
      matingPool(i, :) = popi(indices(i), :);
end
% matingPool = rws(M, scoresi);
end
