function [ histogram ] = CalculateHistogram( db, feature, Q )
% INPUT : 
%           db n x k x 2 (n - number of images, k - number of landmarks)
%           Q number of bins
%           feature is a struct { Polygon, property }
%               Polygon is a vector<LandmarkIndex>
%               property is an integer describing the propery to take from
%               the polygons (area, diameter...).

% OUTPUT : 
%           histogram is a Q x 2  :
%                                   histogram(:,1) - bins locations
%                                   histogram(:,2) - bins frequencies

[n, k, ~] = size(db);

% calculate for the feature its histogram
featureValues = zeros(n, 1);
for i=1:n
    reshapedDB = reshape(db(i, :, :), k, 2);
    featureValues(i) = CalculateFeatureValue(reshapedDB, feature);
end

[binsFrequencies, binsLocations] = hist(featureValues, Q);
histogram = zeros(Q, 2);
histogram(:, 1) = binsLocations;
histogram(:, 2) = binsFrequencies;

end

