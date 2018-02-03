function child = uniformMutation(pm, child, lower, upper)
for i=1:length(child)
        if rand<pm
            child(i)= rand(lower, upper);
        end
end
end
