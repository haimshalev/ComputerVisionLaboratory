function [ ] = RecognizeInputFolder( SourcefolderPath )
%RECOGNIZEINPUTFOLDER - Try to recognize all the pictures in the input
%folder

    
fileList = GetAllFilesSpecificType(SourcefolderPath,'jpg');

[fileListSize,~] = size(fileList);

for i=1:fileListSize
    CurrentFileName = fileList(i);
    LoadAndRecognize(CurrentFileName);
end

end

%% Helper Functions


function [] = LoadAndRecognize(imgName)
%Load an img and try to recognize it's identity from DB
importedImg = imread(imgName);

RecognizePerson(importedImg);

end

