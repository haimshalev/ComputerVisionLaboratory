function [] = Method1Train( positionsDB, dbImages, histogramsPath, M, P, K, t, sigma, useCentroid)
% M - size of patch
% P - list of used landmarks
% k - number of clusters
% t - number of chosen clusters (t clusters with the most members)
% sigma - smoothness parameter


% read the database (db is n x k x 2)
% load(dbLandmarksPath);

if (nargin < 4)
    M = 36;
end

if (nargin < 5)
    P = [6  32  15  51  52  9  35  59  10 16 18 1 20 13 12 53 3 7 17 36];
end

if (nargin < 6)
    K = 50;
end

if (nargin < 7)
    t = 30;
end

if (nargin < 8)
    sigma = 6;
end

if (nargin < 9)
    useCentroid = false;
end


% [numImages,numLandmarks,~] = size(Parts);
% globalDBout = zeros(numImages,numLandmarks,2); % Zahi and Haim landmarks format
% for i=1:numImages
% 
%     % setting all the image to the same size 640x480 (some are in the size of
%     % 320x240)    
%     faceImage = dbImages{i};
%     [R,C] = size(faceImage);
%     factor = 1;
%     if (R == 240)
%         dbImages{i} = imresize(faceImage,2);
%         factor = 2;
%     end
%     
%     patches = reshape(Parts(i,:,:),numLandmarks,4);
%     for j=1:numLandmarks
%         upperLeftX = floor(patches(j,1));
%         upperLeftY = floor(patches(j,2));
%         lowerRightX = floor(patches(j,3));
%         lowerRightY = floor(patches(j,4));
% 
%         centerX = floor((upperLeftX + lowerRightX)/2)*factor;
%         centerY = floor((upperLeftY + lowerRightY)/2)*factor;
%         globalDBout(i,j,:) = [centerX,centerY];
%     end
% end

% histograms is a |P| x t x 128
histograms = Method1InternalTrain(dbImages,positionsDB,  M, P, K, t, sigma, useCentroid);

% write the histograms into file in histogramsPath
save(histogramsPath,'histograms');

end

