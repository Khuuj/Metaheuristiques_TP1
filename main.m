function main()
    %% CONFIGURATION PART 
    % Comment/Uncomment to choose your parameters

    %GENERAL SETTINGS
    N = 100; %Population size
    L = 2; %Chromosome size (2 in case of real encoding)
    Gmax = 50; %Generation max
    pc = 0.8; %Crossover probability
    pm = 0.01; %Mutation probability
    lambda = 10; %Number of children
    M = lambda+mod(lambda, 2); %MatingPool size
    binary = 0; %Encoding mode
    
    %FITNESS AND LIMITATIONS
    %%% ROSENBROCK
    fitnessFunction = @rosenbrock;
    problemFunction = @max;
    lower = [0 0];
    upper = [2 3];
     %%% GRIEWANK
%     fitnessFunction = @griewank;
%     problemFunction = @min;
%     lower = [-30 -30];
%     upper = [30 30];
       
    %SCALING
    scalingFunction = @nop;
%     scalingFunction = @linearScaling;
%     scalingFunction = @sigmaScaling; %need c
    c = 2; %Control parameter : integer between [1,5]
    
    %RANKING
    rankingFunction = @nop;
%      rankingFunction = @firstLinearRanking;
%    rankingFunction = @secondLinearRanking;
%     rankingFunction = @nonLinearRanking;
    alphaRanking = 1.7;
    r=2/N^2;
    nonLinearAlpha = 0.9;

    %SELECTION
    selectionFunction = @rws;
%      selectionFunction = @stochasticUniversalSampling;
%    selectionFunction = @tournamentSelection; %need k
    k = 2; %size of tournament
    
    %CROSSOVER
    %%%% BINARY
%     crossoverFunction = @multiPointCrossover;
%      crossoverFunction = @singlePointCrossover;
%     crossoverFunction = @uniformCrossover; 
%     crossoverFunction = @shuffleCrossover; 
    %%%% REAL
%    crossoverFunction = @blendCrossover; %need alpha    
%     crossoverFunction = @localArithmeticCrossover;
    crossoverFunction = @wholeArithmeticCrossover;
    alpha = 0.5; %control the scope of the expansion
    
    %MUTATION
    %%%% BINARY
%     mutationFunction = @bitFlip;
    %%%% REAL
    mutationFunction = @boundaryMutation;
%     mutationFunction = @nonUniformMutation; %need b
%     mutationFunction = @normalMutation; %need sigma
%    mutationFunction = @polynomialMutation; %need n
%     mutationFunction = @uniformMutation;
    b = 1; %control the speed of the annealing
    sigma = 1; %standard deviation vector
    n = 1; %control parameter
    
    %REPLACEMENT
    tournament = false; % False for kill worst, True for kill tournament
    
    %FEASIBILITY
    feasibilityFunction = @firstMethod;
    %feasibilityFunction = @secondMethod;
    
    %STOPPING CONDITIONS
    threshold = 0; %stop the execution if abs(fitnessMeanGi+1 - fitnessMeanGi) < threshold
    optimalValue = 0; %stop the execution when this value is reached 

    %% EXECUTION PART
    scores = zeros(Gmax+1, N); %scores is a matrix of scores
    oldscores = zeros(Gmax+1, N); %same as scores, used to keep track of scores before fitness modifications
    pop = zeros(Gmax+1, N, L); %pop is a matrix of chromosomes
    % INITIALIZATION
    pop(1,:,:) = initialization(N, L, binary, lower, upper); 
    fitnessMean = 0;
    % Process all generations
    for g=1:Gmax 
    	popg = reshape(pop(g,:, :), [N, L]);    
        % EVALUATION
        [scores(g,:), oldscores(g,:)] = evaluation(fitnessFunction, popg, scalingFunction, c, binary, lower, upper, problemFunction); 
        % STOPPING CRITERIA
        if (stoppingCriteria(oldscores, fitnessMean, threshold, optimalValue, problemFunction, g, N))
            fprintf('Generation %d ',g);
            displayLastGen(fitnessFunction, problemFunction, pop, lower, upper, g-1, N, L, scores, oldscores, binary);
            break;
        end
        fitnessMean = mean(oldscores(g,:));
        % RANKING
        rankedScores = ranking(rankingFunction,scores(g,:), alphaRanking, r, nonLinearAlpha);
        % SELECTION
        matingPool=selection(selectionFunction, rankedScores, M, L, popg, k); %matingPool is a vector of chromosomes
        % CROSSOVER
        children = crossover(crossoverFunction, matingPool, pc, L, alpha); %children is a vector of chromosomes
        % MUTATION
        mutatedChildren = mutation(mutationFunction, children, pm, lower, upper, b, g, Gmax, n, sigma);
        % REPLACEMENT
        pop(g+1,:,:) = replacement(pop(g,:,:), scores(g,:), lambda, k, tournament, mutatedChildren, problemFunction);
        % TEST FEASIBILITY
        pop(g+1,:,:) = testFeasibility(feasibilityFunction, reshape(pop(g+1,:, :), [N, L]), lower, upper, binary);
    end
    
    %% DISPLAY PART
    if (g == Gmax)
        popg = reshape(pop(Gmax+1,:, :), [N, L]);
        [scores(Gmax+1,:), oldscores(Gmax+1,:)] = evaluation(fitnessFunction, popg, scalingFunction, c, binary, lower, upper, problemFunction);
        displayAllOptima(fitnessFunction, problemFunction, pop, lower, upper, Gmax, N, L, oldscores, binary);
        displayLastGen(fitnessFunction, problemFunction, pop, lower, upper, Gmax, N, L, oldscores, binary);
    end
    
end
    

