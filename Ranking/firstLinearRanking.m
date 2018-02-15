function probabilities = firstLinearRanking(ranks, alpha, r, nonLinearAlpha);
% ranks go from 0(best) to N-1(worst)

%we only specify alpha since beta + alpha=2
beta = 2 - alpha; 

n = length(ranks);
probabilities = zeros(1, n);
for i = 1:n
    probabilities(ranks(i)) = (alpha+(i-1)*(beta-alpha)/(n-1))/n;
end
end
