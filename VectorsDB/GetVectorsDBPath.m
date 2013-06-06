function [VectorDBPath] = GetVectorsDBPath()
%GetVectorsDBPath - returns the vectors DB Path


%Gets the vectors DB path from configuration
VectorDBPath = FindSubProjectConfiguration('VectorsDB','VectorsDBPath');

end