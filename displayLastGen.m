function displayLastGen(fitnessFunction, problemFunction, pop, lower, upper, Gmax, N, L, scores, oldscores, binary)
    % Display all chromosomes of the last generation
    [X,Y] = meshgrid(lower(1):.2:upper(1), lower(2):.2:upper(2));   
    figure
    surf(X,Y,fitnessFunction(X,Y));
    
    % Reshape to keep only the last generation
    scoresLG = reshape(scores(Gmax+1,:, :), [N, 1]);
    oldscoresLG = reshape(oldscores(Gmax+1,:, :), [N, 1]);
    popLG = reshape(pop(Gmax+1,:, :), [N, L]); 
    
    % Go through all chromosomes
    for i=1:N
        x = popLG(i,1:L/2);
        y = popLG(i,(L/2)+1:L);
        if (binary)
            x = decode(x,L,lower(1),upper(1));
            y = decode(y,L,lower(2),upper(2));
        end
        % Get z = fitnessFunction(x,y) without fitness modifications
        z = oldscoresLG(i);
        hold on;    
        plot3(x,y,z, 'cX');
        hold off;
    end
    
    % Display differently the chromosome with the extremum fitness
    [maxv, maxi] = problemFunction(scoresLG(Gmax+1,:));
    x = popLG(maxi,1:L/2);
    y = popLG(maxi,(L/2)+1:L);
    if (binary)
        x = decode(x,L,lower(1),upper(1));
        y = decode(y,L,lower(2),upper(2));
    end
    z = oldscoresLG(maxi);
    format short;
    fprintf('Max/Min : %4.2f (before normalizing : %4.2f) was found in (%4.2f,%4.2f)\n', maxv, z, x, y);
    hold on;
    plot3(x,y,z, 'r*');
    hold off;
end