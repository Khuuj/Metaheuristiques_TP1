function scores = evaluation(fitnessFunction, popg, scalingFunction, c)
    %TODO : evaluation for binary encoding
    scores = fitnessFunction(popg);

    % Check if scores contains negatives values, if so use scaling to have only
    % positives values
    minValue = min(scores);
    if (minValue < 0)
        scores = scalingFunction(scores, c);
    end

    if (min(scores) < 0)
        disp('ERROR : some scores values are negatives');
    end
end