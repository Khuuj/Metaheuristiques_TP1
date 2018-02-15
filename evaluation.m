function [scores, oldscores] = evaluation(fitnessFunction, popg, scalingFunction, c, binary, lower, upper)
    N = size(popg,1);
    L = size(popg,2);
    scores = zeros(N, 1); 
    
    for i=1:N
        x = popg(i,1:L/2);
        y = popg(i,(L/2)+1:L);
        if (binary)
            x = decode(x,L,lower(1),upper(1));
            y = decode(y,L,lower(2),upper(2));
        end       
        assert((x >= lower(1)) && (x <= upper(1)), 'A chromosome has a X that does not respect its boundary : %d', x);
        assert((y >= lower(2)) && (y <= upper(2)), 'A chromosome has a Y that does not respect its boundary : %d', y);
        scores(i) = fitnessFunction(x,y);
    end
    
    % Keep track of scores values before modifications
    oldscores = scores;

    % Check if scores contains negatives values
    minValue = min(scores);
    if (minValue < 0)
        scores = scores + 2*abs(minValue);
    end
    assert(min(scores)>0, 'ERROR : some scores values are negatives');
    
    % SCALING
    scores = scalingFunction(scores, c);
end