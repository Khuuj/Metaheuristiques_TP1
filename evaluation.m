function scores = evaluation(popg, fitness, scaling)
scores = fitness(popg);

switch scaling
    case 1
        scores = linearScaling(scores);
    case 2
        scores = sigmaScaling(scores);
    otherwise
        % No scaling
end
end