function mutatedChild = normalMutation(child, sigmaVector)
norm = normrnd(0,1,1,length(child));
mutatedChild=child+norm.*sigmaVector;
end