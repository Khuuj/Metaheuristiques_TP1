function nextGen = replacement(popi, scoresi, lambda, k, tournament, children, problemFunction)
    % This function allows a partial remplacement of one generation to another
    % The goal is to keep the best values and replace the worst ones
worstIndividuals = zeros(1, lambda);
if lambda ~= length(popi)
    
    if tournament == false
        scoresTemp = scoresi;
        for a=1:lambda
              [minimum, I] = min(scoresTemp);
              scoresTemp(I) = [];
              I = find(scoresi==minimum);
              worstIndividuals(a) = I(1);
        end
    else
        worstIndividuals = tournamentSelection(minimisation(scoresi), lambda, k);
    end
    
    nextGen = popi;
    for b = 1:lambda
        nextGen(1,worstIndividuals(b),:) = children(b);
    end   
else 
    nextGen = children;
end
end

    
        