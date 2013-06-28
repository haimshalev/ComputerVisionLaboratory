function [faceSpatialRepresentor] = Method1GenerateVector( histogramsPath, landmarksPath, z, P)

% if z and P are not set then the function uses default values.
if (nargin < 3)
    z = 25;
end

% histograms is a k x Q x 2 - 
% first dim is the landmarks
% second dim is the center of bins,
% third dim is the number of instances in each bin
load(histogramsPath);

% landmarks is k x 2
load(landmarksPath);

originIndex = PrepareOriginIndex();
origin = currOutput(originIndex, :);

% landmarks is k x 2
% landmarksHistograms is k x Q x 2
[k,~] = size(currOutput);

if (nargin < 4)
    P = [2, 29, 52, 61];
end

faceSpatialRepresentor = Method1InternalGenerateVector(currOutput, origin, histograms, z, P);

end

