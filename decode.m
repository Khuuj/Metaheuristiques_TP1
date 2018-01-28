function real = decode(bnum, bbase, floor, ceiling)
real =  bin2dec(bnum)/(2^bbase)*(ceiling-floor)+floor;

end

