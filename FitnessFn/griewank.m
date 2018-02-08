function scores = griewank(popg)
 	N = size(popg,1);
    scores = zeros(N, 1); 
    
    for i=1:N
        x = popg(i,1);
        y = popg(i,2);
        result = ((x.*x) + (y.*y))/4000 - cos(x).*cos(y/sqrt(2)) + 1;
        scores(i) = result;
    end
end