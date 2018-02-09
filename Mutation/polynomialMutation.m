function child = polynomialMutation(child, pm, lower, upper, ~, ~, ~, n, ~)
%TODO : check pm not needed here ?
for i=1:length(child)
    u = rand;
    if u<0.5
        e = (2*u)^(1/(n+1))-1;
    else
        e = 1-(2*(1-u))^(1/(n+1));
    end
    delta = min(upper(i)-child(i), child(i)-lower(i));
    child(i) = child(i)+delta*e;
end
end
