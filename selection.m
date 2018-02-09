function matingPool = selection(selectionFunction, scoresg, M, L, popg, k)
    matingPool = zeros(M,L);
    for i=1:M
          indice = selectionFunction(scoresg, M, k);
          matingPool(i, :) = popg(indice, :);
    end
end
