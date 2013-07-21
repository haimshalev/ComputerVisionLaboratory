function [  ] = TrainAppearanceVocabulary(  )
%TrainAppearanceVocabulary - a wrapper function to all the appearance vocabulary
%train functions

%Get the output path of the positions matrix of the train db
if (strcmp(FindSubProjectConfiguration('AppearanceVocabulary','UseAffineTransform'),'true'))
    positions = load(FindSubProjectConfiguration('TrainDB','AffinedPositionsTrainDBFilePath'));
else
    positions = load(FindSubProjectConfiguration('TrainDB','PositionsTrainDBFilePath'));
end
positions = positions.globalDBout;

%Gets the histogram file path from configuration
appearancePath = GetAppearanceVocabularyPath();

%Gets the trainDB images file
if (strcmp(FindSubProjectConfiguration('AppearanceVocabulary','UseAffineTransform'),'true'))
    images = load(FindSubProjectConfiguration('TrainDB','AffinedImagesFilePath'));
else
    images = load(FindSubProjectConfiguration('TrainDB','ImagesFilePath'));
end
images = images.images;

%Run the actual train method
Method1Train(positions,images,appearancePath);

end

