function binary = encode(x, bbase, floor, ceiling)
inter = (x-floor)/(ceiling-floor)*2^bbase;
binary = dec2bin(inter);

end
