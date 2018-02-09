function mutatedChild = normalMutation(child, pm, ~, ~, ~, ~, ~, ~, sigmaVector)
%TODO : check pm not needed here ?
norm = normrnd(0,1,1,length(child));
mutatedChild=child+norm.*sigmaVector;
end