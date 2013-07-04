clc
clear all
close all

addpath ../Optimization
addpath ../Method1

load('../../Optimization/Method1/Method1ParametersScores009.mat');
[bestQ, bestz, bestP] = Method1GetBestParams( scores, Qs, zs, landmarksPowerset )

fullSets = landmarksPowerset(length(landmarksPowerset));
fullSet = fullSets{1};
numberOfLandmarksSubsets = 2^length(fullSet) - 1; % not including empty set

% plot robustness
method = 'Method1';
histogramsPath = strcat('../..\',method, '\Georgia Tech\histograms.mat');
comparisonPath = strcat('../..\',method, '\Georgia Tech\Comparison\');

alignedImages = false;
if(alignedImages)
    basePath = strcat('../..\FaceDBLandmarks\GT Affine Transformed Colored\Georgia Tech\');
    dbPath = '../..\face-release1.0-basic\output\FaceDB\GT Affine Transformed Colored - Trimmed\globalDB.mat';
else
    basePath = strcat('../..\FaceDBLandmarks\OriginalImages\Georgia Tech\');
    dbPath = '../../FaceDBLandmarks/OriginalImages/Georgia Tech/globalDB.mat';
end

PlotRobustness(@Method1Train, @Method1GenerateVector, bestQ, bestz, bestP, basePath, dbPath, histogramsPath, comparisonPath);

% plot 3D graph run on Qs
for i = 1:length(Qs)
    Qscores = ...
        reshape(scores(i, :, :), length(zs), numberOfLandmarksSubsets);
    figure; mesh(zs, 1:numberOfLandmarksSubsets, Qscores');
    title(strcat('Q = ', num2str(Qs(i))));
    xlabel('z');
    ylabel('P');
    zlabel('score');
    grid on
end

% plot 3D graph run on zs
for i = 1:length(zs)
    zscores = ...
        reshape(scores(:, i, :), length(Qs), numberOfLandmarksSubsets);
    figure; mesh(Qs, 1:numberOfLandmarksSubsets, zscores');
    title(strcat('z = ', num2str(zs(i))));
    xlabel('Q');
    ylabel('P');
    zlabel('score');
    grid on
end

% plot 3D graph run on Ps
for i = 1:length(fullSet)
    zscores = ...
        reshape(scores(:, :, i), length(zs), length(Qs));
    figure; mesh(zs,Qs, zscores');
    title(strcat('landmark = ', num2str(fullSet(i))));
    xlabel('z');
    ylabel('Q');
    zlabel('score');
    grid on
end

rmpath ../Method1
rmpath ../Optimization