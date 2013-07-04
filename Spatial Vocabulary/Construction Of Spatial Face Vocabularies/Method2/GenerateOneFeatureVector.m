function [ featureRepresentor ] = GenerateOneFeatureVector( landmarks, feature, z, featureHistogram )
% landmarks is k x 2
% featureHistogram is Q x 2
% feature is a struct { Polygon, property }
%   Polygon is a vector<LandmarkIndex>
%   property is an integer describing the propery to take from
%   the polygons (area, diameter...).

featureHistogramBinsCenters = featureHistogram(:,1);
Q = length(featureHistogramBinsCenters);

% calc the feature value
featureValue = CalculateFeatureValue(landmarks, feature);

histogramDiffFromLandmark = abs(featureHistogramBinsCenters' - featureValue);
[~,IX] = sort(histogramDiffFromLandmark);

% set the landmarkRepresentor bits
featureRepresentor = zeros(Q, 1);
for i=1:z
    featureRepresentor(IX(i)) = 1;
end

end

