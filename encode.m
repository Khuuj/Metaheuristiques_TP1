function binary = encode(x, L, lower, upper)
inter = (x-lower)/(upper-lower)*2^L;
binary = de2bi(inter, L, 'left-msb');

end
