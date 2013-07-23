function [  ] = UseAppearanceVocabulary(  )
%UseAppearanceVocabulary  load the appearance vocabulary code and unload the
%spatial vocabulary code

%Add the appearance folder to searching path
addpath(genpath(char(FindSubProjectConfiguration('AppearanceVocabulary','folder'))));

%Remove the spatial folder from the searching path
addpath(genpath(char(FindSubProjectConfiguration('SpatialVocabulary','folder'))));
rmpath(genpath(char(FindSubProjectConfiguration('SpatialVocabulary','folder'))));

end