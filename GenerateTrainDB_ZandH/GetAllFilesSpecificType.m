function [ fileList ] = GetAllFilesSpecificType( dirPath , FileType )
    % searches recursively through all subdirectories of a given directory, 
    % collecting a list of all file names it finds for Specific Type
    % Input: 
        % dirPath - directory path 2 search in 
        % FileType - Specific Type, return only files name of this type, 
            % '' - empty string will return all files name
            % 'bmp' - return only bmp file name
            % etc..
    % Output: 
        % fileList - all the files name in dirPath
          
    FileExtensionFilter = strcat('.',FileType);                %# Aad '.' to FileType, for File Extension Filter       
    AllfileList = GetAllFiles(dirPath);                        %# Get all files Name
    
    if strcmp(FileType,'')
        fileList = AllfileList;                                %# if FileType='' return all files name
    else
        fileList = {};                                         %# init fileList 
        [fileListSize,~] = size(AllfileList);                  %# Get number of files
        for ii=1:fileListSize
            [~,~,FileExtension] = fileparts(AllfileList{ii});  %# red current file extension
            if strcmp(FileExtension,FileExtensionFilter)       %# if type of current file is input FileType
                fileList = [fileList; AllfileList{ii}];        %# add current file to fileList
            end
        end
    end
end

