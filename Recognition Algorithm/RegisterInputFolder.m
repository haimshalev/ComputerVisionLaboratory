function [ ] = RegisterInputFolder( SourcefolderPath )
%REGISTERINPUTFOLDER Register all the pictures in the input folder

fprintf(1,'---- Register folder : %s ----\n', SourcefolderPath);

fileList = GetAllFilesSpecificType(SourcefolderPath,'jpg');

[fileListSize,~] = size(fileList);

for i=1:fileListSize
    
    CurrentFileName = fileList(i);
    
    fprintf(2,'Registration number: %d ,Current image Name: %s\n',i,CurrentFileName{1}); 
    
    LoadAndReg(CurrentFileName{1});
end

end

%% Helper Functions


function [] = LoadAndReg(imgName)
%Load an img and register it to the vector DB

importedImg = ScaledImRead(imgName);

RegisterPerson(importedImg,imgName);

end
