function [ ] = RegisterInputFolder( SourcefolderPath )
%REGISTERINPUTFOLDER Register all the pictures in the input folder

fprintf(1,'---- Register folder : %s ----\n', SourcefolderPath);

fileList = GetAllFilesSpecificType(SourcefolderPath,'jpg');

[fileListSize,~] = size(fileList);

Summary = [];

for i=1:fileListSize
    
    CurrentFileName = fileList(i);
    
    fprintf(2,'Registration number: %d ,Current image Name: %s\n',i,CurrentFileName{1}); 
    
    Summary = [Summary  LoadAndReg(CurrentFileName{1})];    
    
end

    %Display the summary of recognition
    DisplaySummary(Summary);

end

%% Helper Functions


function [ returnString ] = LoadAndReg(imgName)
%Load an img and register it to the vector DB

importedImg = ScaledImRead(imgName);

prefix = ['For Image Name :  ' imgName ];
returnString =RegisterPerson(importedImg,imgName);
returnString = {prefix;returnString};

end
