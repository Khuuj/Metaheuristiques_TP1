function scores = sigmaScaling(scores, c)
    fmean = mean(scores);
    sigma = std(scores);

    %gerer si probleme de minimisation
    
    for i=1:length(scores)
        scores(i) = scores(i) - (fmean - c*sigma);
        if scores(i)<=0
            scores(i)=0;
        end
    end
end