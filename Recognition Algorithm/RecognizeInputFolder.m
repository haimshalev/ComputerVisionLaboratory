function [ ] = RecognizeInputFolder( SourcefolderPath )
%RECOGNIZEINPUTFOLDER - Try to recognize all the pictures in the input
%folder

fprintf(1,'---- Recognize folder : %s ----\n', SourcefolderPath);    

fileList = GetAllFilesSpecificType(SourcefolderPath,'jpg');

[fileListSize,~] = size(fileList);

for i=1:fileListSize
    
    CurrentFileName = fileList(i);
    
    fprintf(2,'Recognition number: %d ,Current image Name: %s\n',i,CurrentFileName{1}); 
    
    LoadAndRecognize(CurrentFileName{1});
end

end

%% Helper Functions


function [] = LoadAndRecognize(imgName)
%Load an img and try to recognize it's identity from DB
importedImg = ScaledImRead(imgName);

RecognizePerson(importedImg);

end

