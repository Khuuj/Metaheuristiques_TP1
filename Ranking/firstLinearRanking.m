function probabilities = firstLinearRanking(ranks, alpha)
% ranks go from 0(best) to N-1(worst)

%we only specify alpha since beta + alpha=2
beta = 2 - alpha; 

n = length(ranks);
probabilities = zeros(1, n);
for i = 1:n
    probabilities(i) = (alpha+rank(i)*(beta-alpha)/(n-1))/n;
end
end
