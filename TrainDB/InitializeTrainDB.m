function [ ] = InitializeTrainDB( )
%INITIALIZETRAINDB Initialize the train DB files with an up to date trainDB

%Generate the train db positions structure
[globalDBout, images , affinedPositions , affinedImages] = GenerateTrainDB(FindSubProjectConfiguration('TrainDB','InputDBFolder')); %#ok<NASGU>

%Save the train db structure

outputPath = FindSubProjectConfiguration('TrainDB','ImagesFilePath');
save(outputPath,'images');

outputPath = FindSubProjectConfiguration('TrainDB','PositionsTrainDBFilePath');
save(outputPath,'globalDBout');

%Save the affined db structures
images = affinedImages;
outputPath = FindSubProjectConfiguration('TrainDB','AffinedImagesFilePath');
save(outputPath,'images');

globalDBout = affinedPositions;
outputPath = FindSubProjectConfiguration('TrainDB','AffinedPositionsTrainDBFilePath');
save(outputPath,'globalDBout');

end

