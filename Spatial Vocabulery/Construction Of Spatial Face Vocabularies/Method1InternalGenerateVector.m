function [ faceSpatialRepresentor ] = Method1InternalGenerateVector( landmarks, origin, landmarksHistograms, z, P )
% landmarks is k x 2
% landmarksHistograms is k x Q x 2
[k,~] = size(landmarks);

% if z and P are not set then the function uses default values.
if (nargin < 4)
    z = 10;

    P = 1:k;
end

% filter db according to P
l = length(P);
filteredLandmarks = zeros(l,2);
for i=1:l
    filteredLandmarks(i,:) = landmarks(P(i),:);
end

faceSpatialRepresentor = ...
    GenerateLandmarksVector(filteredLandmarks, origin, z, landmarksHistograms);

end

