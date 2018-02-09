function stop = stoppingCriteria(scores, fitnessMean, threshold, optimalValue)
    stop = 0;
    if (max(scores) > optimalValue)
        disp('optimalValue has been found');
        disp(max(scores));
        stop = 1;
    end
    if (abs(mean(scores) - fitnessMean) < threshold)
        disp('fitnessMean evolution was too small');
        stop = 1;
    end
end