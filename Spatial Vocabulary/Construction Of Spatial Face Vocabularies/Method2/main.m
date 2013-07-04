clc

% dbPath = '../..\FaceDBLandmarks\Georgia Tech\globalDB.mat';
histogramsPath = '../../Method2/Georgia Tech/histograms.mat';
dbPath = '../..\face-release1.0-basic\output\FaceDB\GT Affine Transformed Colored - Trimmed\globalDB.mat';

% train
Method2Train(dbPath, histogramsPath,100);

% Generate a vector
landmarksPath = '../..\FaceDBLandmarks\OriginalImages\Georgia Tech\s01\01.jpg.1.mat';
Method2GenerateVector(histogramsPath, landmarksPath);