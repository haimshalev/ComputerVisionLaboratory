function [ histograms ] = CalculateHistograms( db, P, Q)
% INPUT : 
%           db n x k x 2 (n - number of images, k - number of landmarks)
%           Q number of bins
%           P is a l x 1. l is the number of features.
%               Each cell in P is a struct { Polygon, property }
%               Polygon is a vector<LandmarkIndex>
%               property is an integer describing the propery to take from
%               the polygons (area, diameter...).

% OUTPUT : 
%           histograms is a l x Q x 2

l = length(P);
histograms = zeros(l,Q,2);

% Call CalculateHistogram on each landmark
for i=1:l
    currLandmarkHistogram = ...
        CalculateHistogram(db, P(i), Q);
    histograms(i,:,:) = currLandmarkHistogram;
end

end

