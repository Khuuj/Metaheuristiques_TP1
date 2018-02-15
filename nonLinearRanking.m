function probabilities = nonLinearRanking(ranks, alpha)
%ranks go from N(best) to 1(worst)

n = length(ranks);
probabilities = zeros(1,n);
for i = 1:n
    probabilities(1) = alpha*(1-alpha)^(n-ranks(i));
end
end