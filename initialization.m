function pop = initialization(N, L, binary, lower, upper)
 pop = zeros(N, L);
 for n = 1:N
     for l = 1:L
         if (binary)
             x = randi([0 1]);
         else
             x = lower + (upper - lower)*rand;
         end
         pop(n,l) = x;
     end
 end
end