%AG(N, L, Gmax, pc, pm, f, M, binary, b)
% N is the size of the population 
% L size of binary numbers (chromosome length)
% Gmax generation limit
% pc probability rate of a crossover
% pm probability rate of a mutation of a gene
% binary is wheter we use binary (1) or real (0) encoding
% b is a parameter for nonUniformMutation (controls the speed of the simulated annealing)
% scalingFunction (@linearScaling or @sigmaScaling) 
% optimalValue when reached, the algorithm is stopped

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

function [scores, pop] = main()
    %% CONFIGURATION PART

    %GENERAL SETTINGS
    N = 100; %Population size
    L = 2; %Chromosome size (2 in case of real encoding)
    Gmax = 50; %Generation max
    pc = 0.5; %Crossover probability
    pm = 0.1; %Mutation probability
    M = 100; %MatingPool size
    binary = 0; %Encoding mode
    
    %FITNESS AND LIMITATIONS
    fitnessFunction = @rosenbrock;
    problemFunction = @max;
    lower = [0 0];
    upper = [2 3];
%     fitnessFunction = @griewank;
%     problemFunction = @min;
%     lower = [-30 -30];
%     upper = [30 30];
       

    %SCALING
    scalingFunction = @nop;
%     scalingFunction = @linearScaling;
%     scalingFunction = @sigmaScaling; %need c
    c = 2; %Control parameter : integer between [1,5]
    
    %SELECTION
    selectionFunction = @rws;
%     selectionFunction = @stochasticUniversalSampling;
%     selectionFunction = @tournamentSelection; %need k
    k = 2; %size of tournament
    
    %CROSSOVER
    %%%% BINARY
%     crossoverFunction = @multiPointCrossover;
%     crossoverFunction = @singlePointCrossover;
%     crossoverFunction = @uniformCrossover; 
    %%%% REAL
    crossoverFunction = @blendCrossover; %need alpha 
%     crossoverFunction = @localArithmeticCrossover;
%     crossoverFunction = @wholeArithmeticCrossover;
    alpha = 0.5; %control the scope of the expansion
    
    %MUTATION
    %%%% BINARY
%     mutationFunction = @bitFlip;
    %%%% REAL
%     mutationFunction = @boundaryMutation;
%     mutationFunction = @nonUniformMutation; %need b
%     mutationFunction = @normalMutation; %need sigmaVector
%     mutationFunction = @polynomialMutation; %need n
    mutationFunction = @uniformMutation;
    b = 1; %control the speed of the annealing
    %TODO : what value should take sigmaVector ?
    sigmaVector = ones(L,1); %standard deviation vector
    %TODO : what value should take n ?
    n = 1; %control parameter
    
    %FEASIBILITY
    feasibilityFunction = @firstMethod;
    
    %STOPPING CONDITIONS
    threshold = 0; 
    optimalValue = 100000;

    %% EXECUTION PART
    scores = zeros(Gmax, N); %scores is a matrix of scores
    oldscores = zeros(Gmax, N);
    pop = zeros(Gmax, N, L); %pop is a matrix of chromosomes
    pop(1,:,:) = initialization(N, L, binary, lower, upper);
    fitnessMean = 0;
    for g=1:Gmax
        fprintf('Generation %d\n',g);
    	popg = reshape(pop(g,:, :), [N, L]);    
        [scores(g,:), oldscores(g,:)] = evaluation(fitnessFunction, popg, scalingFunction, c, binary, lower, upper);
        if (stoppingCriteria(scores, fitnessMean, threshold, optimalValue))
            break;
        end
        fitnessMean = mean(scores);

        matingPool=selection(selectionFunction, scores(g,:), M, L, popg, k); %matingPool is a vector of chromosomes
        children = crossover(crossoverFunction, matingPool, pc, L, alpha); %children is a vector of chromosomes
        pop(g+1,:,:) = mutation(mutationFunction, children, pm, lower, upper, b, g, Gmax, n, sigmaVector);
        pop(g+1,:,:) = testFeasibility(feasibilityFunction, reshape(pop(g+1,:, :), [N, L]), lower, upper, binary);
    end
    
    %% DISPLAY PART
    [X,Y] = meshgrid(lower(1):.2:upper(1), lower(2):.2:upper(2));   
    figure
    surf(X,Y,fitnessFunction(X,Y));
    
    format short;
%     disp(oldscores);

    for i=1:Gmax
        [maxv, maxi] = problemFunction(scores(i,:));
        x = pop(i,maxi,1:L/2);
        y = pop(i,maxi,(L/2)+1:L);
        if (binary)
            x = decode(x,L,lower(1),upper(1));
            y = decode(y,L,lower(2),upper(2));
        end
        z = oldscores(i, maxi);
        fprintf('Max : %4.2f (before normalizing : %4.2f) was found in (%4.2f,%4.2f)\n', maxv, z, x, y);
        hold on;    
        
        if (i == Gmax)
            plot3(x,y,z, 'r*');
        else
            plot3(x,y,z, 'cX');
        end
        
        hold off;
    end
    

    
end
    

