function [  ] = InitializeRecognizer( )
%INITIALIZERECOGNIZER - Initalize all the data needed for the algorithm


%% Affine transform model initalization

%Create and save a matrix which shows whic landmark to enable in the detection
EnabledLandmarks = ChooseEnabledLandmarks();
save(GetEnabledLandmarksPath(),'EnabledLandmarks');

%Create An affine model
modelImage = imread('Resources/GT Affine Transformed Colored/s01/01.jpg');
AffineModel = DetectLandmarks(modelImage,1);


%Save the model the to the affine model location
save(GetAffineModelPath(),'AffineModel');


%% Spatial Vocabulary init functions

%Initalize Train DB
GenerateTrainDB();

%Train and create Histogram of Spatial bins
Method1Train(GetTrainDBPath(),GetHistogramsPath());

end