function real = decode(bnum, L, lower, upper)
real =  bi2de(bnum, 'left-msb')/(2^L)*(upper-lower)+lower;

end

