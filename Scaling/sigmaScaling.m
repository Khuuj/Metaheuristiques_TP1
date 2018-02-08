function scores = sigmaScaling(scores, c)
    fmean = mean(scores);
    sigma = std(scores);

    for i=1:length(scores)
        scores(i) = scores(i) - (fmean - c*sigma);
    end
end