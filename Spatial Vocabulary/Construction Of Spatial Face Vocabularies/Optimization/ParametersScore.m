function score = ParametersScore(Q, z, P, TrainMethod, GenerateVectorMethod, methodNum, alignedImages)
% addpath ../Method1
% addpath ../Method2

method = strcat('Method', num2str(methodNum));
% generateVectorMethod = @Method1GenerateVector;
% if (strcmp(method,'Method2'))
%     generateVectorMethod = @Method2GenerateVector;
% end

if(alignedImages)
    basePath = strcat('../..\FaceDBLandmarks\GT Affine Transformed Colored\Georgia Tech\');
    dbPath = '../..\face-release1.0-basic\output\FaceDB\GT Affine Transformed Colored - Trimmed\globalDB.mat';
else
    basePath = strcat('../..\FaceDBLandmarks\OriginalImages\Georgia Tech\');
    dbPath = '../../FaceDBLandmarks/OriginalImages/Georgia Tech/globalDB.mat';
end
histogramsPath = strcat('../..\',method, '\Georgia Tech\histograms.mat');

TrainMethod(dbPath, histogramsPath, Q, P);

allPeopleIds = dir(basePath);
score = 0;
len = 0;
for i=1:length(allPeopleIds)
    if (allPeopleIds(i).isdir && ~strcmp(allPeopleIds(i).name,'.') && ...
        ~strcmp(allPeopleIds(i).name,'..'))
        
        % Inter
        interDistances = ...
            CalcInterHammingDistancesHist(basePath,allPeopleIds(i).name,...
                                     histogramsPath, GenerateVectorMethod, z, P);

        % Intra
        intraDistances = ...
            CalcIntraHammingDistancesHist(basePath,allPeopleIds(i).name,...
                                          histogramsPath, GenerateVectorMethod, z, P);
        
        score = score + Method1Score(intraDistances, interDistances,Q*length(P));
        len = len + 1;
    end
end
score = score/len;
end