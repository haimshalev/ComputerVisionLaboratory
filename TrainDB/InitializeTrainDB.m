function [ ] = InitializeTrainDB( )
%INITIALIZETRAINDB Initialize the train DB files with an up to date trainDB

%Generate the train db positions structure
[globalDBout,patchesTrainDBout , images] = GenerateTrainDB(FindSubProjectConfiguration('TrainDB','InputDBFolder')); %#ok<NASGU>

%Save the train db structure
outputPath = FindSubProjectConfiguration('TrainDB','PatchesTrainDBFilePath');
save(outputPath,'patchesTrainDBout');

outputPath = FindSubProjectConfiguration('TrainDB','ImagesFilePath');
save(outputPath,'images');

outputPath = FindSubProjectConfiguration('TrainDB','PositionsTrainDBFilePath');
save(outputPath,'globalDBout');

end

