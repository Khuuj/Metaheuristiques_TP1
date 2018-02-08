function child = uniformMutationAntonin(pm, lower, upper, child)
len = length(lower);
for i=1:len
    if rand<pm
        mutation=rand;
        child(i) = upper(i)*mutation+(1-mutation)*lower(i);
    end
end
end