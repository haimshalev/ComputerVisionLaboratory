function [ AppearanceDBPath ] = GetAppearanceVocabularyPath(  )
%GetAppearanceVocabulary - returns the appearance train db data file path

%Gets the data file path from configuration
AppearanceDBPath = FindSubProjectConfiguration('AppearanceVocabulary','AppearanceDBPath');

end