function selected = stochasticUniversalSampling(N, scoresi)
r = rand;
angle = 1/N;
selected = zeros(1,N);
for i=1:N
    arrow = r*sum(scoresi)+(i-1)*angle;
    if arrow>=1
        arrow = arrow-1;
    end
    compteur = 0;
    while arrow >= 0
           arrow = compteur + 1;
           arrow = arrow - scoresi(compteur);
    end
    selected(i) = compteur;
end
end
