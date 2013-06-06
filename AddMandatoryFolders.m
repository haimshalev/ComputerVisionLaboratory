function [] = AddMandatoryFolders()
%Add necessery folders and subfolders to project searching paths

% Read the xml file
try
   tree = xmlread('ConfigurationFile.xml');
catch
   error('Failed to read XML file %s.',filename);
end

   %Get the mandatory folders node
   MandatoryFoldersNode = tree.getElementsByTagName('MandatoryFolderPaths');
   MandatoryFoldersNode = MandatoryFoldersNode.item(0);

   % Get the list of folders that we need to add to path
   folders = MandatoryFoldersNode.getElementsByTagName('folder');
   
   %Iterate over all folders
   for i = 0:folders.getLength-1
       
       %Retrive the folder path from the xml node
       folderPath = folders.item(i).getFirstChild.getData;
       
       %Add folder to searching paths
       addpath(genpath(char(folderPath)));
   end
   
end