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

%% Initalize Train DB

InitializeTrainDB();

%% Spatial Vocabulary init functions

%The spatial vocabulary code have some functions with the same name of the
%functions in the appearance vocabulary, so each time we use one of the
%vocabularies functions we need to specify which one we use.
UseSpatialVocabulary();

%Train and create Histogram of Spatial bins
TrainSpatialVocabulary();

%% Appearance Vocabulary init functions

%The spatial vocabulary code have some functions with the same name of the
%functions in the appearance vocabulary, so each time we use one of the
%vocabularies functions we need to specify which one we use.
UseAppearanceVocabulary();

% Train function of the appearance vocabulary
TrainAppearanceVocabulary();

end