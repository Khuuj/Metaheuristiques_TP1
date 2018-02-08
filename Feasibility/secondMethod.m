function x = secondMethod(x, upper, lower)
if x<lower
    x=2*lower - x;
end
if x>upper
    x=2*upper - x;
end
end