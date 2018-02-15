function selected = stochasticUniversalSampling(scoresg, M, ~)
    r = rand;
    angle = 1/M;
    selected = zeros(M,1);
    sumScore = sum(scoresg);
    for i=1:M
        arrow = (r+(i-1)*angle)*sum(scoresg);
        if arrow>=sum(scoresg)
            arrow = arrow-sum(scoresg);
        end
        compteur = 0;
        while arrow >= 0
               compteur = compteur + 1;
               arrow = arrow - scoresg(compteur);
        end
        selected(i) = compteur;
    end
end
