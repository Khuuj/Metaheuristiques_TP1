function selected = rws(M, scoresi)
fitnessSum = sum(scoresi);
selected = zeros(M,1);
for i=1:M
    r = rand;
    while r==1
        r = rand;
    end
    throw = r*fitnessSum;
    compteur = 0;
    while throw >= 0
           compteur = compteur + 1;
           throw = throw - scoresi(compteur);
    end
    selected(i) = compteur;
end
end
