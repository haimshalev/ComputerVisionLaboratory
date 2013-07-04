addpath ../Method1
addpath ../Method2

close all
clc
Q = 55;
z = 25;
method = 'Method1';
generateVectorMethod = @Method1GenerateVector;
trainMethod = @Method1Train;
P = [2  29  52  61];

if (strcmp(method,'Method2'))
    generateVectorMethod = @Method2GenerateVector;
    trainMethod = @Method2Train;
    
    % init P
    P = PrepareFeatures();
end

alignedImages = false;
nihadAndNimrod = true;
if(nihadAndNimrod)
    basePath = '../..\face-release1.0-basic\output\Computer_Vision_Lab\CV_DB_ver3_11_06_13\';
    dbPath = '../..\face-release1.0-basic\output\Computer_Vision_Lab\CV_DB_ver3_11_06_13\globalDB.mat';
    histogramsPath = strcat('../..\',method, '\CV_DB_ver3_11_06_13\histograms.mat');
    comparisonPath = strcat('../..\',method, '\CV_DB_ver3_11_06_13\Comparison\');
else
    if(alignedImages)
        basePath = strcat('../..\FaceDBLandmarks\GT Affine Transformed Colored\Georgia Tech\');
        dbPath = '../..\face-release1.0-basic\output\FaceDB\GT Affine Transformed Colored - Trimmed\globalDB.mat';
    else
        basePath = strcat('../..\FaceDBLandmarks\OriginalImages\Georgia Tech\');
        dbPath = '../../FaceDBLandmarks/OriginalImages/Georgia Tech/globalDB.mat';
    end

    histogramsPath = strcat('../..\',method, '\Georgia Tech\histograms.mat');
    comparisonPath = strcat('../..\',method, '\Georgia Tech\Comparison\');
end

PlotRobustness(trainMethod, generateVectorMethod, Q, z, P, basePath, dbPath, histogramsPath, comparisonPath);

rmpath ../Method1
rmpath ../Method2