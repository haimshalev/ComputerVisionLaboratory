function score = ParametersScore(K, z, P, Q, M, sigma, useCentroid,...
                                 TrainMethod, GenerateVectorMethod,...
                                 methodNum, testBasePath, globalDBout, testImagesPath, dbImages)
% addpath ../Method1
% addpath ../Method2

method = strcat('Method', num2str(methodNum));
% generateVectorMethod = @Method1GenerateVector;
% if (strcmp(method,'Method2'))
%     generateVectorMethod = @Method2GenerateVector;
% end
histogramsPath = strcat('../..\',method, '\Georgia Tech\histograms.mat');

% TrainMethod(dbPath, histogramsPath, Q, P);
                          
TrainMethod( globalDBout,dbImages,  histogramsPath, M, P, K, Q, sigma, useCentroid);

[ personId2Descriptor,allPeopleIds ] = ...
    CreatePersonId2DescriptorDic( testBasePath, histogramsPath, testImagesPath,...
                                  GenerateVectorMethod, z, M, P, sigma );

score = 0;
len = 0;
for i=1:length(allPeopleIds)
    if (allPeopleIds(i).isdir && ~strcmp(allPeopleIds(i).name,'.') && ...
        ~strcmp(allPeopleIds(i).name,'..'))
        
        % Inter
        interDistances = ...
            CalcInterHammingDistancesHist(testBasePath,personId2Descriptor,allPeopleIds(i).name);
%             CalcInterHammingDistancesHist(basePath,allPeopleIds(i).name,...
%                                      histogramsPath, GenerateVectorMethod, z, P);

        % Intra
        intraDistances = ...
            CalcIntraHammingDistancesHist(testBasePath,personId2Descriptor,allPeopleIds(i).name);
%             CalcIntraHammingDistancesHist(basePath,allPeopleIds(i).name,...
%                                           histogramsPath, GenerateVectorMethod, z, P);
        
        score = score + Method1Score(intraDistances, interDistances,Q*length(P));
        len = len + 1;
    end
end
score = score/len;
end