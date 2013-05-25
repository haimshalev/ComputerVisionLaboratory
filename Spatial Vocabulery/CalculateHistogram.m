function [ histogram ] = CalculateHistogram( singleTypeLandmarks, originsLocations, Q )
% singleTypeLandmarks is a n x 2 (n - number of images)

% OUTPUT : 
%           histogram is a Q x 2  :
%                                   histogram(:,1) - bins locations
%                                   histogram(:,2) - bins frequencies

[n,~] = size(singleTypeLandmarks);

% calculate for each landmark its distance from the origin
distances = zeros(n,1);
for i=1:n
    distances(i) = CalculateDistance(singleTypeLandmarks(i,:),originsLocations(i,:));
end

[binsFrequencies,binsLocations] = hist(distances,Q);
histogram = zeros(Q,2);
histogram(:,1) = binsLocations;
histogram(:,2) = binsFrequencies;

end

