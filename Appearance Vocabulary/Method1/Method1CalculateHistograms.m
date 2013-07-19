function [ histograms ] = Method1CalculateHistograms(dbImages, landmarksDB, M, K, t, sigma, useCentroid)
% landmarksDB n x l x 2 (n - number of images, l - number of chosen landmarks)
% OUTPUT : histograms is a l x t x 128

[n,l,~] = size(landmarksDB);
histograms = zeros(l,t,128);

% Call CalculateHistogram on each landmark
for i=1:l
    currLandmarkHistogram = ...
        Method1CalculateHistogram(dbImages, reshape(landmarksDB(:,i,:),n,2), M, K, t, sigma, useCentroid);
    histograms(i,:,:) = currLandmarkHistogram;
end

end

