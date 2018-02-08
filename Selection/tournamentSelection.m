function indice = tournamentSelection(scoresi, k)
    best = 0;
    for i=1:k
        pos = randi(length(scoresi));
        if best < scoresi(pos)
            best = scoresi(pos);
            indice = pos;
        end
    end
end
