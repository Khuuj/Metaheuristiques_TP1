function nextGen = replacement(popi, scoresi, lambda, k, tournament, children)
worstIndividuals = zeros(1, lambda);
if lambda ~= length(popi)
    if tournament == false
        for a=1:lambda
            worst = scoresi(1);
            worstI = 1;
            for j = 2:length(scoresi)
                if scoresi(j)<worst
                    worstI = j;
                    worst = scoresi(j);
                end
            end
            worstIndividuals(a) = worstI;
            scoresi(worstI)= [];
        end
    else
        worstIndividuals = tournamentSelection(minimisation(scoresi), lambda, k);
    end
    
    nextGen = popi;
    for b = 1:lambda
        nextGen(worstIndividuals(b)) = children(b);
    end
        
else 
    nextGen = children;
end


end

    
        