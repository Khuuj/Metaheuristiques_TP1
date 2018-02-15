function gen = displayAllOptima(problemFunction, pop, lower, upper, Gmax, N, L, oldscores, binary, goodValue)
    % Display chromosome with extremum fitness foreach generation
%     [X,Y] = meshgrid(lower(1):.2:upper(1), lower(2):.2:upper(2));   
%     figure
%     surf(X,Y,fitnessFunction(X,Y));
    
    format short;
    bit = 1;
    gen = 0;
    
    poptemp = reshape(pop(1, :, :),[N ,L]);
    xoptimum = poptemp(1,1:L/2);
    yoptimum = poptemp(1,(L/2)+1:L);
    optimum = oldscores(1, 1);
    if (binary)
        xoptimum = decode(poptemp(1,1:L/2),L/2, lower(1), upper(1));
        yoptimum = decode(poptemp(1,1:L/2),L/2, lower(2), upper(2));
    end 
    ioptimum = 1;
    % Go through all generations
    for i=1:Gmax+1
        fprintf('Generation %d ',i);
        [optiv, opti] = problemFunction(oldscores(i,:));
        poptemp = reshape(pop(i, :, :),[N ,L]);
        x = poptemp(opti,1:L/2);
        y = poptemp(opti,(L/2)+1:L);
        if (binary)
            x = decode(x,L/2,lower(1),upper(1));
            y = decode(y,L/2,lower(2),upper(2));
        end
        z = oldscores(i, opti);
        if (isequal(problemFunction, @min) && z<optimum) || (isequal(problemFunction, @max) && z>optimum)
            optimum  = z;
            xoptimum = x;
            yoptimum = y;
            ioptimum = i;
        end
        fprintf('Optimum : %4.4f was found for (%4.4f,%4.4f)\n', z, x, y);
%         hold on;    
% 
%         % Display differently the extremum of the last generation
%         if (i == Gmax+1)
%             plot3(x,y,z, 'r*');
%         else
%             plot3(x,y,z, 'cX');
%         end
% 
%         hold off;
        
        if (bit && problemFunction(z,goodValue) == z)
            gen = i;
            bit = 0; 
        end
    end
    fprintf('Optimum : %4.4f was found for (%4.2f,%4.2f) on generation %d\n', optimum, xoptimum, yoptimum, ioptimum);
end