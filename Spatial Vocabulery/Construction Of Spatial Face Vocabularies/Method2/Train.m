function [ histograms ] = Train( db, Q, P )
% INPUT : 
%           db n x k x 2 (n - number of images, k - number of landmarks)
%           Q number of bins
%           P is a l x 1. l is the number of features.
%               Each cell in P is a struct { Polygon, property }
%               Polygon is a vector<LandmarkIndex>
%               property is an integer describing the propery to take from
%               the polygons (area, diameter...).

% OUTPUT : 
%           histograms is a l x t x Q x 2
%           where t is the maximum number of polygons across the features P

% calculate all the chosen landmarks histograms
histograms = CalculateHistograms(db, P, Q);

end

