clc

% dbPath = '../..\FaceDBLandmarks\OriginalImages\Georgia Tech\globalDB.mat';
histogramsPath = '../../Method1/Georgia Tech/histograms.mat';
dbPath = '../..\FaceDBLandmarks\OriginalImages\Georgia Tech\globalDB.mat';
% dbPath = strcat('../..\FaceDBLandmarks\GT Affine Transformed Colored\Georgia Tech\globalDB.mat');
% train
Method1Train(dbPath,histogramsPath);
% return
% Generate a vector
landmarksPath = '../..\FaceDBLandmarks\OriginalImages\Georgia Tech\s01\01.jpg.1.mat';
Method1GenerateVector(histogramsPath, landmarksPath);