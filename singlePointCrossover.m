function singlePointCrossover(N, L, firstChild, secondChild)
    singlePoint = randi([1, L-1]);
    buff = firstChild((singlePoint+1):N);
    firstChild((singlePoint+1):N) = secondChild((singlePoint+1):N);
    secondChild((singlePoint+1):N) = buff;
end