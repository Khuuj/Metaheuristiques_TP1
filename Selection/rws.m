function selected = rws(N, scoresi)
fitnessSum = sum(scoresi);
selected = zeros(1,N);
for i=1:N
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
