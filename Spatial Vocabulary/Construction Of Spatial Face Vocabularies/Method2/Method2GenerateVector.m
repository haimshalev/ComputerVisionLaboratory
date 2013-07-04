function [faceSpatialRepresentor] = Method2GenerateVector( histogramsPath, landmarksPath, z, P )

% if z is not set then the function uses default values.
if (nargin < 3)
    z = 15;
end

if (nargin < 4)
    P = PrepareFeatures();
end

% histograms is a k x Q x 2 - 
% first dim is the landmarks
% second dim is the center of bins,
% third dim is the number of instances in each bin
load(histogramsPath);

% landmarks is k x 2
load(landmarksPath);

faceSpatialRepresentor = Method2InternalGenerateVector(currOutput, histograms, z, P);

end

