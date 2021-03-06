function [ faceSpatialRepresentor ] = GenerateLandmarksVector( landmarks, landmarksHistograms, z, image, M, sigma )
% landmarks is k x 2
% landmarksHistograms is k x Q x 2

[k,Q,~] = size(landmarksHistograms);
faceSpatialRepresentor = zeros(k*Q,1);
for i=1:k
    landmark = landmarks(i,:);
    landmarkHistogram = reshape(landmarksHistograms(i,:,:),Q,128);
    landmarkRepresentor = GenerateOneLandmarkVector( landmark, landmarkHistogram, z, image, M, sigma );
     
    faceSpatialRepresentor(Q*(i-1) + 1:Q*i) = landmarkRepresentor;
end

end

