function [ histograms ] = Method1InternalTrain( dbImages,dbLandmarks, M, P, K, t, sigma, useCentroid )
% INPUT : 
%           db n x k x 2 (n - number of images, k - number of landmarks)
%           Q number of bins
%           P is a l x 1 (l <= k) of indices of chosen landmarks

% OUTPUT : 
%           histograms is a l x t x 128

[n,k,~] = size(dbLandmarks);

% filter db according to P
l = length(P);
filteredDB = zeros(n,l,2);
for i=1:l
    filteredDB(:,i,:) = dbLandmarks(:,P(i),:);
end

% calculate all the chosen landmarks histograms
histograms = Method1CalculateHistograms(dbImages,filteredDB, M, K, t, sigma, useCentroid);


end

