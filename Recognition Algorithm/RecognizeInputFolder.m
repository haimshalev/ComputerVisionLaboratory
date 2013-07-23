function [ ] = RecognizeInputFolder( SourcefolderPath )
%RECOGNIZEINPUTFOLDER - Try to recognize all the pictures in the input
%folder

fprintf(1,'---- Recognize folder : %s ----\n', SourcefolderPath);    

fileList = GetAllFilesSpecificType(SourcefolderPath,'jpg');

[fileListSize,~] = size(fileList);

Summary = [];

for i=1:fileListSize
    
    CurrentFileName = fileList(i);
    
    fprintf(2,'Recognition number: %d ,Current image Name: %s\n',i,CurrentFileName{1}); 
    
    Summary = [Summary  LoadAndRecognize(CurrentFileName{1})];    
    
end

    %Display the summary of recognition
    DisplaySummary(Summary);
end

%% Helper Functions


function [returnString] = LoadAndRecognize(imgName)
%Load an img and try to recognize it's identity from DB
importedImg = ScaledImRead(imgName);

prefix = ['For Image Name :  ' imgName ];
returnString =RecognizePerson(importedImg);
returnString = {prefix;returnString};

end

