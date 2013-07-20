function [  ] = TrainAppearanceVocabulary(  )
%TrainAppearanceVocabulary - a wrapper function to all the appearance vocabulary
%train functions

%Get the output path of the positions matrix of the train db
positionsPath = FindSubProjectConfiguration('TrainDB','PositionsTrainDBFilePath');

%Gets the histogram file path from configuration
appearancePath = GetAppearanceVocabularyPath();

%Gets the trainDB images file path
imagesPath = FindSubProjectConfiguration('TrainDB','ImagesFilePath');

%Run the actual train method
Method1Train(positionsPath,load(imagesPath),appearancePath);

end

