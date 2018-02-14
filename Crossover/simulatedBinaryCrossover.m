function children = simulatedBinaryCrossover(firstParent, secondParent, ~)
n=length(firstParent);
firstChild = zeros(1, n);
secondChild = zeros(1,n);

for i=1:n
    u = rand;
    if u<=0.5
        beta = (2*u)^(1/(n+1));
    else
        beta=(2*(1-u))^-(1/n+1);
    end
    firstChild(i) = 0.5*(firstParent(i)+secondParent(i))+0.5*beta*(firstParent(i)-secondParent(i));
    secondChild(i) = 0.5*(firstParent(i)+secondParent(i))+0.5*beta*(secondParent(i)-firstParent(i));
end
children = [firstChild, secondChild];
end