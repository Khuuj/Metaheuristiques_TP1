function probabilities = secondLinearRanking(ranks, r)
%ranks go from 1(best) to N(worst)

n = length(ranks);

%q is calculated with r
q = r*(n-1)/2 + 1/n;

probabilities = zeros(n);
for i = 1:n
    probabilities(i) = q-(ranks(i)-1)*r;
end
end

