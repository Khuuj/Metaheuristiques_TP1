function scores = rosenbrock(popg)
    N = size(popg,1);
    scores = zeros(N, 1); 
    
    for i=1:N
        x = popg(i,1);
        y = popg(i,2);
        a = x.*x;
        b = y - a;

        %result = -((1 - a) + 100*(b .* b));
        result = -((1 - a) + 100*(b .* b));
        scores(i) = result;
    end
end