function fitnessTransfer = minimisation(scoresi)
fitnessMax = scoresi(1);
for j=2:length(scoresi)
    if scoresi(j)>fitnessMax
        fitnessMax = scoresi(j);
    end
end
fitnessTransfer = fitnessMax-scoresi;
end