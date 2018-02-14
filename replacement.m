function nextGen = replacement(popi, scoresi, lambda, k, tournament, children)
worstIndividuals = zeros(1, lambda);
if lambda ~= length(popi)
    if tournament == false
        for a=1:lambda
            worst = scoresI(1);
            for j = 2:length(scoresi)
                if scoresi(j)<worst
                    worst = j;
                end
            end
            worstIndividuals(a) = worst;
            scoresi(worst)= [];
        end
    else
        worstIndividuals = tournamentSelection(minimisation(scoresi, lambda, k);
    end
    
    nextGen = popi;
    for b = 1:lambda
        nextGen(worstIndividuals(b)) = children(b);
    end
        
else 
    nextGen = children;
end


end

    
        