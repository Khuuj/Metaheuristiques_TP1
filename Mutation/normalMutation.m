function child = normalMutation(child, pm, ~, ~, ~, ~, ~, ~, sigmaVector)
for i=1:length(child)
    if rand<pm
        child(i) = child(i)+normrnd(0,1)*sigmaVector(i);
    end
end
end