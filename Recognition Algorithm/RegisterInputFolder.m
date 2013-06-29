function [ ] = RegisterInputFolder( SourcefolderPath )
%REGISTERINPUTFOLDER Register all the pictures in the input folder

    
fileList = GetAllFilesSpecificType(SourcefolderPath,'jpg');

[fileListSize,~] = size(fileList);

for i=1:fileListSize
    CurrentFileName = fileList(i);
    LoadAndReg(CurrentFileName);
end

end

%% Helper Functions


function [] = LoadAndReg(imgName)
%Load an img and register it to the vector DB

importedImg = imread(imgName);

RegisterPerson(importedImg,imgName);

end
