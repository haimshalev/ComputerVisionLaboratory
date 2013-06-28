function [] = PlotRobustness( trainMethod, generateVectorMethod, Q, z, P, basePath, dbPath, histogramsPath, comparisonPath )

trainMethod( dbPath, histogramsPath, Q, P);

allPeopleIds = dir(basePath);

n = 0;
for i=1:length(allPeopleIds)
    if (allPeopleIds(i).isdir && ~strcmp(allPeopleIds(i).name,'.') && ...
        ~strcmp(allPeopleIds(i).name,'..'))
        n = n + 1;
    end
end

%globalDistances = struct(n);
globalDistancesIndex = 1;

for i=1:length(allPeopleIds)
    if (allPeopleIds(i).isdir && ~strcmp(allPeopleIds(i).name,'.') && ...
        ~strcmp(allPeopleIds(i).name,'..'))
        disp(allPeopleIds(i).name)
        
        % Inter
        interDistances = ...
            CalcInterHammingDistancesHist(basePath,allPeopleIds(i).name,...
                                     histogramsPath,generateVectorMethod, z, P);

        % Intra
        intraDistances = ...
            CalcIntraHammingDistancesHist(basePath,allPeopleIds(i).name,...
                                          histogramsPath,generateVectorMethod, z, P);
        
        globalDistances(globalDistancesIndex) = ...
            struct('id', allPeopleIds(i).name, 'interDistances', interDistances, 'intraDistances', intraDistances);
        globalDistancesIndex = globalDistancesIndex + 1;
                                      
        % display the two histograms in one 
        [interDistancesBinsCounts, interDistancesBinsCenters] = hist(interDistances');
        [intraDistancesBinsCounts, intraDistancesBinsCenters] = hist(intraDistances');
        
        % normalize to get percentage
        interDistancesBinsCounts = interDistancesBinsCounts/(sum(interDistancesBinsCounts(:)));
        intraDistancesBinsCounts = intraDistancesBinsCounts/(sum(intraDistancesBinsCounts(:)));
        
        f = figure('Visible','off');
        plot(intraDistancesBinsCenters,intraDistancesBinsCounts);
        hold on
        plot(interDistancesBinsCenters,interDistancesBinsCounts,'Color','red');
        
        currPersonComparison = strcat(comparisonPath,allPeopleIds(i).name,'.jpg');
        saveas(f, currPersonComparison);
    end
end

thresholdTruePositive = zeros(Q*length(P), 1);
thresholdTrueNegative = zeros(Q*length(P), 1);
thresholdFalsePositive = zeros(Q*length(P), 1);
thresholdFalseNegative = zeros(Q*length(P), 1);

for threshold=1:Q*length(P)
    truePositivesCount = 0;
    trueNegativesCount = 0;
    falsePositivesCount = 0;
    falseNegativesCount = 0;
    
    intraDistancesCount = 0;
    interDistancesCount = 0;
    for i=1:n
        truePositivesCount = truePositivesCount + numel(globalDistances(i).intraDistances(globalDistances(i).intraDistances <= threshold));
        trueNegativesCount = trueNegativesCount + numel(globalDistances(i).interDistances(globalDistances(i).interDistances > threshold));
        falsePositivesCount = falsePositivesCount + numel(globalDistances(i).interDistances(globalDistances(i).interDistances <= threshold));
        falseNegativesCount = falseNegativesCount + numel(globalDistances(i).intraDistances(globalDistances(i).intraDistances > threshold));
        
        interDistancesCount = interDistancesCount + numel(globalDistances(i).interDistances);
        intraDistancesCount = intraDistancesCount + numel(globalDistances(i).intraDistances);
    end
    thresholdTruePositive(threshold) = truePositivesCount/intraDistancesCount;
    thresholdTrueNegative(threshold) = trueNegativesCount/interDistancesCount;
    thresholdFalsePositive(threshold) = falsePositivesCount/interDistancesCount;
    thresholdFalseNegative(threshold) = falseNegativesCount/intraDistancesCount;
end

x = 1:Q*length(P);

figure;
title('true poisitive vs true negative');
plot(x, thresholdTruePositive, 'r', x, thresholdTrueNegative, 'b');
legend('true poisitive', 'true negative');

figure;
title('false positive vs false negative');
plot(x, thresholdFalsePositive, 'r',x, thresholdFalseNegative,'b')
legend('false positive','false negative');
end