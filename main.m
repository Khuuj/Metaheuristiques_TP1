function main()
    %% CONFIGURATION PART

    %GENERAL SETTINGS
    N = 100; %Population size
    L = 2; %Chromosome size (2 in case of real encoding)
    Gmax = 50; %Generation max
    pc = 0.8; %Crossover probability
    pm = 0.01; %Mutation probability
    lambda = N/10; %Number of children
    M = lambda+mod(lambda, 2); %MatingPool size
    binary = 0; %Encoding mode
    
    tournament = true; %determines if tournament selection is used for replacement
    
    %FITNESS AND LIMITATIONS
    %%% ROSENBROCK
    fitnessFunction = @rosenbrock;
    problemFunction = @max;
    lower = [0 0];
    upper = [2 3];
    goodValue = -0.02;
    %%% GRIEWANK
%     fitnessFunction = @griewank;
%     problemFunction = @min;
%     lower = [-30 -30];
%     upper = [30 30];
%     goodValue = 0.02;
       

    %SCALING
    scalingFunction = @nop;
%     scalingFunction = @linearScaling;
%     scalingFunction = @sigmaScaling; %need c
    c = 2; %Control parameter : integer between [1,5]
    
    %SELECTION
%    selectionFunction = @rws;
     selectionFunction = @stochasticUniversalSampling;
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
    optimalValue = 0;

    %% EXECUTION PART
    scores = zeros(Gmax+1, N); %scores is a matrix of scores
    oldscores = zeros(Gmax+1, N);
    pop = zeros(Gmax+1, N, L); %pop is a matrix of chromosomes
    pop(1,:,:) = initialization(N, L, binary, lower, upper);
    fitnessMean = 0;
    for g=1:Gmax 
    	popg = reshape(pop(g,:, :), [N, L]);    
        [scores(g,:), oldscores(g,:)] = evaluation(fitnessFunction, popg, scalingFunction, c, binary, lower, upper);
        if (stoppingCriteria(oldscores, fitnessMean, threshold, optimalValue, problemFunction, g, N))
            fprintf('Generation %d ',g);
            displayLastGen(fitnessFunction, problemFunction, pop, lower, upper, g-1, N, L, scores, oldscores, binary);
            break;
        end
        fitnessMean = mean(oldscores(g,:));

        %remplacer M par lambda+mod(lambda, 2)
        
        matingPool=selection(selectionFunction, scores(g,:), M, L, popg, k); %matingPool is a vector of chromosomes
        children = crossover(crossoverFunction, matingPool, pc, L, alpha); %children is a vector of chromosomes
        mutatedChildren = mutation(mutationFunction, children, pm, lower, upper, b, g, Gmax, n, sigmaVector);
        pop(g+1,:,:) = replacement(pop(g,:,:), scores(g,:), lambda, k, tournament, mutatedChildren, problemFunction);
        pop(g+1,:,:) = testFeasibility(feasibilityFunction, reshape(pop(g+1,:, :), [N, L]), lower, upper, binary);
    end
    if (g == Gmax)
        popg = reshape(pop(Gmax+1,:, :), [N, L]);
        [scores(Gmax+1,:), oldscores(Gmax+1,:)] = evaluation(fitnessFunction, popg, scalingFunction, c, binary, lower, upper);

        %% DISPLAY PART
        gen = displayAllMax(fitnessFunction, problemFunction, pop, lower, upper, Gmax, L, scores, oldscores, binary, goodValue);
        displayLastGen(fitnessFunction, problemFunction, pop, lower, upper, Gmax, N, L, scores, oldscores, binary);
        fprintf("GENERATION %d\n",gen);
    end
    
end
    

