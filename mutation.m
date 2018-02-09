function children = mutation(mutationFunction, children, pm, lower, upper, b, g, Gmax, n, sigmaVector)
	%FIXME : lower and upper are now vectors (check all mutations)
	for i=1:length(children)
	    children(i) = mutationFunction(children(i), pm, lower, upper, b, g, Gmax, n, sigmaVector);
	end
end