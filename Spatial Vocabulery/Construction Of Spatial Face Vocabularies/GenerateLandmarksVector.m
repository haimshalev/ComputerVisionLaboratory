function [ faceSpatialRepresentor ] = GenerateLandmarksVector( landmarks, origin, z, landmarksHistograms )
% landmarks is k x 2
% landmarksHistograms is k x Q x 2

[k,Q,~] = size(landmarksHistograms);
faceSpatialRepresentor = zeros(k*Q,1);
for i=1:k
    landmark = landmarks(i,:);
    landmarkHistogram = reshape(landmarksHistograms(i,:,:),Q,2);
    landmarkRepresentor = GenerateOneLandmarkVector( landmark, origin, z, landmarkHistogram );
     
    faceSpatialRepresentor(Q*(i-1) + 1:Q*i) = landmarkRepresentor;
end

end

