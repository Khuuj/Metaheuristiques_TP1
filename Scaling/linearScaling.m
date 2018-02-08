function scores = linearScaling(scores)
    fmin = min(scores);
    fmean = mean(scores);
    fmax = max(scores);

    a = fmean / (fmean - fmin);
    b = fmean*fmin / (fmax - fmin);

    for i=1:length(scores)
        scores(i) = a*scores(i) + b;
    end
end