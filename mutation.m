function children = mutation(mutationFunction, children, pm, lower, upper, b, g, Gmax, n, sigmaVector)
	for i=1:size(children,1)
	    children(i,:) = mutationFunction(children(i,:), pm, lower, upper, b, g, Gmax, n, sigmaVector);
	end
end