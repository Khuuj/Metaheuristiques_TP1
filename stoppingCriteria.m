function stop = stoppingCriteria(scores, fitnessMean, threshold, optimalValue, problemFunction, g, N)
    stop = 0;
    scores = reshape(scores(g,:, :), [N, 1]);
    extremum = problemFunction(scores);
    if (problemFunction(extremum,optimalValue) == extremum )
        fprintf('optimalValue has been found : %4.2f\n', extremum);
        stop = 1;
    end
    if (abs(mean(scores) - fitnessMean) < threshold)
        disp('fitnessMean evolution was too small');
        stop = 1;
    end
end