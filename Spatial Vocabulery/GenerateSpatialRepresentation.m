function [ SpatialRepresentationVector ] = GenerateSpatialRepresentation( PositionsMatrix )
%Generate spatial vector representation and return it

%Get the histograms path
histogramsPath = GetHistogramsPath();

% histograms is a k x Q x 2 - 
% first dim is the landmarks
% second dim is the center of bins,
% third dim is the number of instances in each bin
load(histogramsPath);

originIndex = PrepareOriginIndex();

origin = PositionsMatrix(originIndex, :);

SpatialRepresentationVector = Method1InternalGenerateVector(PositionsMatrix, origin, histograms);


end

