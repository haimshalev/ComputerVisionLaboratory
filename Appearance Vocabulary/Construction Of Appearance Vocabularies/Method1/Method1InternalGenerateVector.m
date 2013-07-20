function [ faceSpatialRepresentor ] = Method1InternalGenerateVector( landmarks, landmarksHistograms, z, image, M, P, sigma )

% filter db according to P
l = length(P);
filteredLandmarks = zeros(l,2);
for i=1:l
    filteredLandmarks(i,:) = landmarks(P(i),:);
end

faceSpatialRepresentor = ...
    GenerateLandmarksVector(filteredLandmarks, landmarksHistograms, z, image, M, sigma);

end

