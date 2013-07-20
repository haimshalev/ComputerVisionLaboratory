addpath ../Method1
addpath ../SIFT

close all
clc

method = 'Method1';
generateVectorMethod = @Method1GenerateVector;
trainMethod = @Method1Train;

P = [6  32  15  51  52  9  35  59  10 16 18 1 20 13 12 53 3 7 17 36];
K = 50;
Q = 30;
z = 5;
M = 36;
sigma = 6;
useCentroid = 0;
alignedImages = false;
nihadAndNimrod = false;

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
        testBasePath = strcat('../..\FaceDBLandmarks\OriginalImages\Georgia Tech\');
        testImagesPath = '../../FaceDB\OriginalImages\Georgia Tech\Images\';

%         dbPath = '../../FaceDB\BigDB\patch_init.mat';
        load('../../FaceDB\BigDB\positionsDB.mat');
        trainingDBImages = GetImagesDB('../../FaceDB\BigDB\AllImages');
% 
%         dbPath = '../../FaceDBLandmarks/OriginalImages/Georgia Tech/globalDB.mat';
%         trainingDBImages = GetImagesDB('C:\develop\LabInCV-Appearance\FaceDB\OriginalImages\Georgia Tech\AllImages');
    end

    histogramsPath = strcat('../..\',method, '\Georgia Tech\histograms.mat');
    comparisonPath = strcat('../..\',method, '\Georgia Tech\Comparison\');
end

PlotRobustness(trainMethod, generateVectorMethod,  M, P, K, z, Q, sigma, useCentroid,...
               testBasePath, testImagesPath, trainingDBImages, globalDBout, histogramsPath, comparisonPath);

rmpath ../Method1