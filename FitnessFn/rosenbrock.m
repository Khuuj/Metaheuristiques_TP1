function result = rosenbrock(x, y)
    result = -(100*(y - x.^2).^2 + (1 - x).^2);
end
