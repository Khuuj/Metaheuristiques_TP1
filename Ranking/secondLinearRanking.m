function probabilities = secondLinearRanking(ranks, alphaRanking, r, nonLinearAlpha);
%ranks go from 1(best) to N(worst)

n = length(ranks);

%q is calculated with r
q = r*(n-1)/2 + 1/n;

probabilities = zeros(1, n);
for i = 1:n
    probabilities(ranks(i)) = q-(i-1)*r;
end
end

