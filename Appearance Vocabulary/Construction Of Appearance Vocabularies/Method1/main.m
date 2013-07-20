clc
% close all
addpath ../SIFT

histogramsPath = '../../Method1/Georgia Tech/histograms.mat';

% build a dictionary with all the images named according to their index
% BuildImagesDB( '../../FaceDB\BigDB\OriginalImages','../../FaceDB\BigDB\AllImages\');

% dbLandmarksPath = '../../FaceDB\BigDB\patch_init.mat';

% train
dbImages = GetImagesDB('../../FaceDB\BigDB\AllImages');
load('../../FaceDB\BigDB\positionsDB.mat');
Method1Train(globalDBout, dbImages, histogramsPath);


% Generate a vector
landmarksPath = '../..\FaceDBLandmarks\OriginalImages\Georgia Tech\s01\01.jpg.1.mat';
image = imread('../../FaceDB\OriginalImages\Georgia Tech\Images\s01\01.jpg');
Method1GenerateVector(histogramsPath, image, landmarksPath);