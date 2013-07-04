function [ faceSpatialRepresentor ] = Method2InternalGenerateVector( landmarks, featuresHistograms, z, P )
% INPUT : 
%           landmarks k x 2 (k - number of landmarks)
%           featureHistograms is l x Q x 2 (l - number of features)

% OUTPUT : 
%           faceSpatialRepresentor is a l*Q x 1 vector


[l, Q, ~] = size(featuresHistograms);

% l == length(P);

faceSpatialRepresentor = zeros(l*Q, 1);

for i=1:l
    featureHistogram = reshape(featuresHistograms(i, :, :), Q, 2);
    featureRepresentor = GenerateOneFeatureVector(landmarks, P(i), z, featureHistogram);
    
    faceSpatialRepresentor(Q*(i-1) + 1:Q*i) = featureRepresentor;
end

end

