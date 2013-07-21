function [  ] = TrainAppearanceVocabulary(  )
%TrainAppearanceVocabulary - a wrapper function to all the appearance vocabulary
%train functions

%Get the output path of the positions matrix of the train db
positions = load(FindSubProjectConfiguration('TrainDB','PositionsTrainDBFilePath'));
positions = positions.globalDBout;

%Gets the histogram file path from configuration
appearancePath = GetAppearanceVocabularyPath();

%Gets the trainDB images file 
images = load(FindSubProjectConfiguration('TrainDB','ImagesFilePath'));
images = images.images;

%Run the actual train method
Method1Train(positions,images,appearancePath);

end

