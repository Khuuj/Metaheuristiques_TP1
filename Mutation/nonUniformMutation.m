function child = nonUniformMutation(pm, child, lower, upper, b, Gmax, g)
for i=1:length(child)
        if rand<pm
            if rand>=0.5
                child(i) = child(i) + delta(g, upper - child(i), b, Gmax);
            else
                child(i) = child(i) - delta(g, child(i) - lower, b, Gmax);
            end
        end
end
end

function d = delta(g, y, b, Gmax)
    d = y*(1 - rand((1 - g)/Gmax)^b);
end