function [ SpatialRepresentationVector ] = GenerateSpatialRepresentation( PositionsMatrix )
%A wrapper function to the GenerateSpatialRepresentations functions

%Switch over the available methods
switch (str2double(FindSubProjectConfiguration('SpatialVocabulary','Method')))
    case (1)
        SpatialRepresentationVector = GenerateSpatialRepresentation1(PositionsMatrix);
    case (2)
        SpatialRepresentationVector = GenerateSpatialRepresentation2(PositionsMatrix);
    otherwise
        error('The chosen spatial representaion method is unavailabe. Please choose an enabled method and restart program');
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ SpatialRepresentationVector ] = GenerateSpatialRepresentation1( PositionsMatrix )
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

% if z and P are not set then the function uses default values.
z = 25;
P = [2, 29, 52, 61];

SpatialRepresentationVector = Method1InternalGenerateVector(PositionsMatrix, origin, histograms, z, P);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ SpatialRepresentationVector ] = GenerateSpatialRepresentation2( PositionsMatrix )
%Generate spatial vector representation and return it

% if z is not set then the function uses default values.
z = 15;
P = PrepareFeatures();

%Get the histograms path
histogramsPath = GetHistogramsPath();

% histograms is a k x Q x 2 - 
% first dim is the landmarks
% second dim is the center of bins,
% third dim is the number of instances in each bin
load(histogramsPath);

SpatialRepresentationVector = Method2InternalGenerateVector(PositionsMatrix, histograms, z, P);

end