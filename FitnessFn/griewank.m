function result = griewank(x,y)
    result = ((x.*x) + (y.*y))/4000 - cos(x).*cos(y/sqrt(2)) + 1;
end