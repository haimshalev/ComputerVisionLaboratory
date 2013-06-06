function [HistogramsPath] = GetHistogramsPath()
%GetHistogramsPath - returns the spatial train db histogram file path

%Gets the histogram file path from configuration
HistogramsPath = FindSubProjectConfiguration('SpatialVocabulary','HistogramsPath');

end