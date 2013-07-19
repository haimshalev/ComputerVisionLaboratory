function [ words ] = Method1CalculateHistogram( dbImages,singleTypeLandmarks, M, K, t, sigma, useCentroid )
% singleTypeLandmarks is a n x 2 (n - number of images)

% OUTPUT : 
%           histogram is a t x 128  : t words in size of 128

[n,~] = size(singleTypeLandmarks);

% calculate for each landmark its distance from the origin
descriptors = zeros(128,n);
for i=1:n
    descriptors(:,i) = CalculateDescriptor(dbImages{i}, singleTypeLandmarks(i,:), M, sigma);
end

% IDX - cluster index of each descriptor (n x 1)
descriptors = descriptors';
[IDX,centroids] = kmeans(descriptors,K,'emptyaction','drop');

% get the best t clusters (according to number of members)
[MM idx] = unique( sort(IDX) );
centroidsCounts = diff([0;idx]);
[B,IX] = sort(centroidsCounts,'descend');
bestClustersIndices = MM(IX(1:t));

% use the center of the cluster
words = centroids(bestClustersIndices,:);

% or - use the closest descriptor in the cluster
if (~useCentroid)
    for i=1:t
        repeatedCentroid = repmat(words(i,:),n,1);
        dists = sum((repeatedCentroid' - descriptors').^2);
        [~,I] = min(dists);
        words(i,:) = descriptors(I,:);
    end
end

end

