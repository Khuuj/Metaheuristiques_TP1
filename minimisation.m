function fitnessTransfer = minimisation(scoresi)
	% If the problem is a minimisation, chromosomes with the lowest fitness values 
	% should be the ones with the highest probabilities to be selected
	% This function should be used before selection to assure this
	fitnessMax = max(scoresi);
	fitnessTransfer = fitnessMax-scoresi;
end