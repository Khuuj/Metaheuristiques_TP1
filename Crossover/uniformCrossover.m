function children = uniformCrossover(p, firstParent, secondParent)
for i=1:length(firstParent)
    if rand<p
        temp=firstParent(i);
        firstParent(i) = secondParent(i);
        secondParent(i)=temp;
    end
end
children = [firstParent; secondParent];

end