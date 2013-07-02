function [  ] = InitializeRecognizer( )
%INITIALIZERECOGNIZER - Initalize all the data needed for the algorithm

close all
clc

%% Affine transform model initalization

%Create and save a matrix which shows whic landmark to enable in the detection
EnabledLandmarks = ChooseEnabledLandmarks();  %#ok<NASGU>
save(GetEnabledLandmarksPath(),'EnabledLandmarks');

%Create An affine model
modelImage = imread(FindSubProjectConfiguration('AffineTransform','ModelInputImage'));
AffineModel = DetectLandmarks(modelImage,1);  %#ok<NASGU>


%Save the model the to the affine model location
save(GetAffineModelPath(),'AffineModel');


%% Spatial Vocabulary init functions

%Initalize Train DB

%Generate the train db positions structure
globalDBout = GenerateTrainDB(FindSubProjectConfiguration('TrainDB','InputDBFolder')); %#ok<NASGU>

%Save the train db structure
outputFolder = FindSubProjectConfiguration('TrainDB','TrainDBFolder');
save(strcat(outputFolder, '/globalDB'),'globalDBout');

%Train and create Histogram of Spatial bins
TrainSpatialVocabulary(GetTrainDBPath(),GetHistogramsPath());

end