function children = uniformCrossover(firstParent, secondParent, ~)
%TODO : determine p
% fpScore = ;
% spScore = ;
% p = fpScore / (fpScore + spScore);
p = 0.5;

for i=1:length(firstParent)
    if rand<p
        temp=firstParent(i);
        firstParent(i) = secondParent(i);
        secondParent(i)=temp;
    end
end
children = [firstParent; secondParent];

end