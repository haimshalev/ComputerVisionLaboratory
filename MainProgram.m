function [] = MainProgram()

clc

%Initialize the TrainDB and create spatial vocabulary histogram
InitializeRecognizer();

%Clean the vector DB
RemoveAllPersonsFromDB();

%Load images and register
LoadAndReg('Resources\GT Affine Transformed Colored\s01\01.jpg');
LoadAndReg('Resources\GT Affine Transformed Colored\s02\01.jpg');
LoadAndReg('Resources\GT Affine Transformed Colored\s03\01.jpg');

%Load images and ty to recognize them
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