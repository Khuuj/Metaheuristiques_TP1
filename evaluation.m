function scores = evaluation(popg, fitness, scaling)
scores = fitness(popg);

switch scaling
    case 1
        linearScaling(scores);
    case 2
        sigmaScaling(scores);
    otherwise
        % No scaling
end
end