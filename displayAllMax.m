function displayAllMax(fitnessFunction, problemFunction, pop, lower, upper, Gmax, L, scores, oldscores, binary)
    [X,Y] = meshgrid(lower(1):.2:upper(1), lower(2):.2:upper(2));   
    figure
    surf(X,Y,fitnessFunction(X,Y));

    format short;

    for i=1:Gmax+1
        [maxv, maxi] = problemFunction(scores(i,:));
        x = pop(i,maxi,1:L/2);
        y = pop(i,maxi,(L/2)+1:L);
        if (binary)
            x = decode(x,L,lower(1),upper(1));
            y = decode(y,L,lower(2),upper(2));
        end
        z = oldscores(i, maxi);
        fprintf('Max : %4.2f (before normalizing : %4.2f) was found in (%4.2f,%4.2f)\n', maxv, z, x, y);
        hold on;    

        if (i == Gmax+1)
            plot3(x,y,z, 'r*');
        else
            plot3(x,y,z, 'cX');
        end

        hold off;
    end
end