function [ faceSpatialRepresentor ] = Method1InternalGenerateVector( landmarks, origin, landmarksHistograms, z, P )

% filter db according to P
l = length(P);
filteredLandmarks = zeros(l,2);
for i=1:l
    filteredLandmarks(i,:) = landmarks(P(i),:);
end

faceSpatialRepresentor = ...
    GenerateLandmarksVector(filteredLandmarks, origin, z, landmarksHistograms);

end

