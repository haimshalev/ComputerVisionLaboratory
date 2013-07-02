function [ fileList ] = GetAllFiles(dirPath)
    % searches recursively through all subdirectories of a given directory, 
    % collecting a list of all file names it finds
    % Input: dirPath - directory path 2 search in 
    % Output: fileList - all the files name in dirPath

    dirData = dir(dirPath);                             %# Get the data for the current directory
    dirIndex = [dirData.isdir];                         %# Find the index for directories
    fileList = {dirData(~dirIndex).name}';              %'# Get a list of the files
    if ~isempty(fileList)
        fileList = cellfun(@(x) fullfile(dirPath,x),fileList,'UniformOutput',false);    %# Prepend path to files                      
    end
    subDirs = {dirData(dirIndex).name};                 %# Get a list of the subdirectories
    validIndex = ~ismember(subDirs,{'.','..'});         %# Find index of subdirectories that are not '.' or '..'
                                                       
    for iDir = find(validIndex)                         %# Loop over valid subdirectories
        nextDir = fullfile(dirPath,subDirs{iDir});      %# Get the subdirectory path
        fileList = [fileList; GetAllFiles(nextDir)];    %# Recursively call getAllFiles
    end
end
