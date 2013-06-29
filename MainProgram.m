function [] = MainProgram()
%Main Program run and test all the needed code for this project

%Clear the old figures and echos
clc;close all;

%Add necessery folders and subfolders to project searching paths
AddMandatoryFolders();

%Initialize the TrainDB and create spatial vocabulary histogram
%InitializeRecognizer();

%Clean the vectors DB
RemoveAllPersonsFromDB();

%Load images and register the to the vectors DB
RegisterInputFolder(FindSubProjectConfiguration('RecognitionAlgorithm','RegisterSubjectsFolder'));

%Load images and try to recognize them
RecognizeInputFolder(FindSubProjectConfiguration('RecognitionAlgorithm','RecognizeSubjectsFolder'));

end