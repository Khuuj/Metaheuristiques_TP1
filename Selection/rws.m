function selected = rws(scoresg, M, ~)
    fitnessSum = sum(scoresg);
    selected = zeros(1,M);
    for i=1:M
        r = rand;
        while r==1
            r = rand;
        end
        throw = r*fitnessSum;
        compteur = 0;
        while throw >= 0
               compteur = compteur + 1;
               throw = throw - scoresg(compteur);
        end
        selected(i) = compteur;
    end
end
