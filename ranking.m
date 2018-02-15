function rankedScores = ranking(rankingFunction, scores, alphaRanking, r, nonLinearAlpha)
[sortedScores, sortedI] = sort(scores,'descend');
rankedScores = rankingFunction(sortedI, alphaRanking, r, nonLinearAlpha);
end