function rankedScores = ranking(rankingFunction, scores, alphaRanking, r, nonLinearAlpha)
if ~isequal(rankingFunction, @nop)
    [sortedScores, sortedI] = sort(scores,'descend');
    rankedScores = rankingFunction(sortedI, alphaRanking, r, nonLinearAlpha);
else
    rankedScores = scores;
end
end