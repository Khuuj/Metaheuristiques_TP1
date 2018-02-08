function scores = evaluation(popi, fitness, scaling)
scores = fitness(popi(:));

switch scaling
    case 1
        linearScaling(scores);
    case 2
        sigmaScaling(scores);
    otherwise
        % No scaling
end
end
