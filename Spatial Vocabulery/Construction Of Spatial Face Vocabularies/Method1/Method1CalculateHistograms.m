function [ histograms ] = Method1CalculateHistograms( landmarksDB, originsLocations, Q)
% landmarksDB n x l x 2 (n - number of images, l - number of chosen landmarks)
% OUTPUT : histograms is a l x Q x 2

[n,l,~] = size(landmarksDB);
histograms = zeros(l,Q,2);

% Call CalculateHistogram on each landmark
for i=1:l
    currLandmarkHistogram = ...
        Method1CalculateHistogram(reshape(landmarksDB(:,i,:),n,2),originsLocations,Q);
    histograms(i,:,:) = currLandmarkHistogram;
end

end

