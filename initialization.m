function pop = initialization(N, L)
 pop = zeros(N, L);
 for n = 1:N
     for l = 1:L
        bit = randi([0 1]);
        pop(n,l) = bit;
     end
 end
end