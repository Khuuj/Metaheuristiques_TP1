function child = boundaryMutation(pm, child, upper, lower)
for i=1:length(child)
        if rand<pm
            if rand>0.5
                child(i)=upper;
            else
                child(i)=lower;
            end
        end
end
end
