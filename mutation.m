function children = mutation(children, pm, mutationFunction, b, Gmax, g, lower, upper)
for i=1:length(children)
    children(i) = mutationFunction(pm, children(i), lower, upper);
    %mutated = mutationFunction(children, pm, b, Gmax, g);
end
end