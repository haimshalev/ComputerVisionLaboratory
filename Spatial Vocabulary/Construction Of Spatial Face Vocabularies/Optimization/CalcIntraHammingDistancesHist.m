function [ distances ] = ...
    CalcIntraHammingDistancesHist(basePath,personId,...
                                     histogramsPath,generateVectorMethod, z, P)

% get all the current other person's images
k = 1;
personDir = strcat(basePath,personId);
personLandmarkFiles = dir(strcat(personDir,'/*.mat'));
for i=1:length(personLandmarkFiles)
    if (~strcmp(personLandmarkFiles(i).name,'.') && ...
        ~strcmp(personLandmarkFiles(i).name,'..'))
        
        personLandmarkFilePath1 = strcat(personDir,'/',personLandmarkFiles(i).name);
        personRepresentor1 = ...
            generateVectorMethod(histogramsPath,personLandmarkFilePath1, z, P);
        
        for j=i+1:length(personLandmarkFiles)
            
            personLandmarkFilePath2 = strcat(personDir,'/',personLandmarkFiles(j).name);
            personRepresentor2 = ...
                generateVectorMethod(histogramsPath,personLandmarkFilePath2, z, P);
            
            % calculate hamming distance
            distances(k) = ...
                CalcHammingDistance(personRepresentor1,personRepresentor2);
            k = k+1;
        end
    end
end

