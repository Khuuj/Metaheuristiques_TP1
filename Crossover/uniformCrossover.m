function children = uniformCrossover(firstParent, secondParent, ~)
%TODO : determine p

for i=1:length(firstParent)
    if p<rand
        temp=firstParent(i);
        firstParent(i) = secondParent(i);
        secondParent(i)=temp;
    end
end
children = [firstParent; secondParent];

end