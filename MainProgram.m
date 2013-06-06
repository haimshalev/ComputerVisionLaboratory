function [] = MainProgram()
%Main Program run and test all the needed code for this project

%Clear the Command window
clc

%Add necessery folders and subfolders to project searching paths
AddMandatoryFolders();

%Initialize the TrainDB and create spatial vocabulary histogram
InitializeRecognizer();

%Clean the vectors DB
RemoveAllPersonsFromDB();

%Load images and register the to the vectors DB
LoadAndReg('Resources\GT Affine Transformed Colored\s01\01.jpg');
LoadAndReg('Resources\GT Affine Transformed Colored\s02\01.jpg');
LoadAndReg('Resources\GT Affine Transformed Colored\s03\01.jpg');

%Load images and try to recognize them
LoadAndRecognize('Resources\GT Affine Transformed Colored\s02\01.jpg');
LoadAndRecognize('Resources\GT Affine Transformed Colored\s02\10.jpg');

end

%% Helper Functions


function [] = LoadAndReg(imgName)
%Load an img and register it to the vector DB

importedImg = imread(imgName);

RegisterPerson(importedImg,imgName);

end

function [] = LoadAndRecognize(imgName)
%Load an img and try to recognize it's identity from DB
importedImg = imread(imgName);

RecognizePerson(importedImg);

end