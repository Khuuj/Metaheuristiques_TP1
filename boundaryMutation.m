function child = boundaryMutation(pm, child)
for i=1:length(child)
        if rand<pm
            if rand>0.5
                child(i)=1;
            else
                child(i)=0;
            end
        end
end
end
