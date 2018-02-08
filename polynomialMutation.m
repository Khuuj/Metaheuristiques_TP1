function child = polynomialMutation(n, uppers, lowers, child)
for i=1:length(child)
    u = rand;
    if u<0.5
        e = (2*u)^(1/(n+1))-1;
    else
        e = 1-(2*(1-u))^(1/(n+1));
    end
    delta = min(uppers(i)-child(i), child(i)-lowers(i));
    child(i) = child(i)+delta*e;
end
end
