function [ histograms ] = Method1InternalTrain( db, Q, P )
% INPUT : 
%           db n x k x 2 (n - number of images, k - number of landmarks)
%           Q number of bins
%           P is a l x 1 (l <= k) of indices of chosen landmarks

% OUTPUT : 
%           histograms is a l x Q x 2

originIndex = PrepareOriginIndex();

[n,k,~] = size(db);
originsLocations = reshape(db(:,originIndex,:),n,2);

% filter db according to P
l = length(P);
filteredDB = zeros(n,l,2);
for i=1:l
    filteredDB(:,i,:) = db(:,P(i),:);
end

% calculate all the chosen landmarks histograms
histograms = Method1CalculateHistograms(filteredDB,originsLocations,Q);


end

