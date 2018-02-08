
%AG(N, L, Gmax, pc, pm, f, M)
% N is the size of the population 
% L size of binary numbers (chromosome length)
% Gmax generation limit
% pc probability rate of a crossover
% pm probability rate of a mutation of a gene

%xi is the ith indivdual
%xi,j is the jth gene of ith indivdual
%yi = fitness of ith individual

%M size of mating pool
%p1 is the first parent
%p2 is the seconde parent
%e1 first child of the crossover
%e2 seconde child of the crossover
%ei (i€[1,2] can go through a mutation)

%Pk is the population of the kth generation
%Gk is the kth generation

%f(x) is the fitness function
%fi fitness value of ith individual
%pi fitness relative value = probability of being selected into the mating
%pool
%pi=fi/sum(fi) i:=(1,N)

%RWS = roulette wheel selection
%angle of the ith section of the roulette is 2*PI*pi
%selection into mating pool = landing into roulette section
%selection = 2*PI*rand(0,1)
%|-> k individual is seleced if sum(pi)[i:1,k-1]<rand<sum(pi)[i:1,k]
%repeat selection m times

%CROSSOVER
%create a random permutation of M integers and pair them 2 by 2 increasingly ( Perm(1) & Perm(2), Perm(3) & Perm(4), ...)  
%Perm(i)=j signifies that the ith element of the permutation is the jth
%element of the mating pool
%USE randperm
%given probability pc the parents either:
%   -give birth to children
%   -become the children themselves
%compute the chance to mutate
%either mutate on the memory of the crossover or on the children
%|-> bit-flip mutation 0->1, 1->0

%FLOWCHART
%initialisation=>(evaluation=>selection=>crossover=>mutation)*Gmax=>

function pop = main(N, L, Gmax, pc, pm, fitness, M, selectionFunction, crossoverFunction, mutationFunction)
scores = zeros(Gmax, N); %scores is a matrix of scores
pop = zeros(Gmax, N, L); %pop is a matrix of chromosomes
%f=@fitness;

pop(1, :, :) = initialization(N, L);
for i=1:Gmax
    scores(i,:)=evaluation(pop(i, :, :), fitness);
    matingPool=selection(scores(i, :), M, L, pop(i, :, :), selectionFunction); %matingPool is a vector of chromosomes
    children = crossover(matingPool, pc, crossoverFunction); %children is a vector of chromosomes
    pop(i+1, :, :) = mutation(children, pm, mutationFunction); 
end
end


    

