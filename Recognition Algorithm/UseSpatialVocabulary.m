function [  ] = UseSpatialVocabulary(  )
%USESPATIALVOCABULARY  load the spatial vocabulary code and unload the
%appearance vocabulary code

%Add the spatial folder to searching path
addpath(genpath(char(FindSubProjectConfiguration('SpatialVocabulary','folder'))));

%Remove the appearance folder from the searching path
rmpath(genpath(char(FindSubProjectConfiguration('AppearanceVocabulary','folder'))));

end

