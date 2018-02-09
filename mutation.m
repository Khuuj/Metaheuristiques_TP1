function mutated = mutation(mutationFunction, children, pm, lower, upper, b, g, Gmax, n, sigmaVector)
%FIXME : lower and upper are now vectors (check all mutations)
mutated = mutationFunction(children, pm, lower, upper, b, g, Gmax, n, sigmaVector);
end