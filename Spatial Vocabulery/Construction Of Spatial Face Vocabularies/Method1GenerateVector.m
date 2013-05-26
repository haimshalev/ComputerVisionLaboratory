function [faceSpatialRepresentor] = Method1GenerateVector( histogramsPath, landmarksPath )

% histograms is a k x Q x 2 - 
% first dim is the landmarks
% second dim is the center of bins,
% third dim is the number of instances in each bin
load(histogramsPath);

% landmarks is k x 2
load(landmarksPath);

originIndex = PrepareOriginIndex();
origin = currOutput(originIndex, :);

faceSpatialRepresentor = Method1InternalGenerateVector(currOutput, origin, histograms);

end

