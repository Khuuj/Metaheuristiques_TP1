function selected = stochasticUniversalSampling(scoresg, M, ~)
    r = rand;
    angle = 1/M;
    selected = zeros(M,1);
    for i=1:N
        arrow = r*sum(scoresg)+(i-1)*angle;
        if arrow>=1
            arrow = arrow-1;
        end
        compteur = 0;
        while arrow >= 0
               arrow = compteur + 1;
               arrow = arrow - scoresg(compteur);
        end
        selected(i) = compteur;
    end
end
