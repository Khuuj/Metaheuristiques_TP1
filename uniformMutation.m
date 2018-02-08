function child = uniformMutation(pm, child, lower, upper)
for i=1:length(child)
        if rand<pm
            child(i)= lower + (upper - lower)*rand;
        end
end
end
