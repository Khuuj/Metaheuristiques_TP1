function probabilities = nonLinearRanking(ranks, alphaRanking, r, nonLinearAlpha);
%ranks go from N(best) to 1(worst)

n = length(ranks);
probabilities = zeros(1,n);
for i = 1:n
    probabilities(ranks(i)) = nonLinearAlpha*(1-nonLinearAlpha)^(i-1);
end
end