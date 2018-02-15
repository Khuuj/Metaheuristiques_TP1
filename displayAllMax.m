function displayAllMax(fitnessFunction, problemFunction, pop, lower, upper, Gmax, L, scores, oldscores, binary)
    % Display chromosome with extremum fitness foreach generation
    [X,Y] = meshgrid(lower(1):.2:upper(1), lower(2):.2:upper(2));   
    figure
    surf(X,Y,fitnessFunction(X,Y));

    format short;

    % Go through all generations
    for i=1:Gmax+1
        fprintf('Generation %d ',i);
        [maxv, maxi] = problemFunction(scores(i,:));
        x = pop(i,maxi,1:L/2);
        y = pop(i,maxi,(L/2)+1:L);
        if (binary)
            x = decode(x,L,lower(1),upper(1));
            y = decode(y,L,lower(2),upper(2));
        end
        z = oldscores(i, maxi);
        fprintf('Max/Min : %4.4f was found in (%4.2f,%4.2f)\n', z, x, y);
        hold on;    

        % Display differently the extremum of the last generation
        if (i == Gmax+1)
            plot3(x,y,z, 'r*');
        else
            plot3(x,y,z, 'cX');
        end

        hold off;
    end
end