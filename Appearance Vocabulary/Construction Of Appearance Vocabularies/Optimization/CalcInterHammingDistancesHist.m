function distances = CalcInterHammingDistancesHist(basePath,personId2Descriptor,personId)%(basePath,imagesPath,personId,...
                                     %histogramsPath,generateVectorMethod, z, M, P, sigma, otherPeopleId)

if (nargin < 10)
    % all people except the given person
    allPeopleIds = dir(basePath);
    
    j = 1;
    for i=1:length(allPeopleIds)
        if (allPeopleIds(i).isdir && ~strcmp(allPeopleIds(i).name,'.') && ...
            ~strcmp(allPeopleIds(i).name,'..') && ~strcmp(allPeopleIds(i).name,personId))
            otherPeopleId(j,:) = allPeopleIds(i).name;
            j = j + 1;
        end
    end
end

% load the landmarks of the person (the first one)
% personDir = strcat(basePath, personId);
% personImageDir = strcat(imagesPath,personId);
% personLandmarkFiles = dir(strcat(personDir,'/*.mat'));
% personImages = dir(strcat(personImageDir,'/*.jpg'));
% % skipping the '.' and '..' files
% firstLandmarksFilePath = strcat(personDir,'/',personLandmarkFiles(3).name);
% 
% personImagePath = strcat(personImageDir,'/',personImages(3).name);
% image = rgb2gray(imread(personImagePath));

% calculate the person vector
personRepresentors = values(personId2Descriptor,{personId});
personRepresentors = values(personRepresentors{1});%...
personRepresentor = personRepresentors(1);
personRepresentor = personRepresentor{1};
    %generateVectorMethod(histogramsPath, image, firstLandmarksFilePath, z, M, P, sigma);

[l, ~] = size(otherPeopleId);
k = 1;
for i=1:l
    
%     % get all the current other person's images
    otherPersonDir = strcat(basePath,otherPeopleId(i,:));
%     otherPersonImageDir = strcat(imagesPath,otherPeopleId(i,:));
    otherPersonLandmarkFiles = dir(strcat(otherPersonDir,'/*.mat'));
%     otherPersonImages = dir(strcat(otherPersonImageDir,'/*.jpg'));
    
    otherPersonRepresentors = values(personId2Descriptor,{otherPeopleId(i,:)});
    otherPersonRepresentors = otherPersonRepresentors{1};
    for j=1:length(otherPersonLandmarkFiles)
        
%         % calculate the current other person vector
%         currLandmarksFilePath = ...
%             strcat(otherPersonDir,'/',otherPersonLandmarkFiles(j).name);
%         
%         otherPersonImagePath = strcat(otherPersonImageDir,'/',otherPersonImages(j).name);
%         otherPersonImage = rgb2gray(imread(otherPersonImagePath));

        currOtherPersonRepresentor = values(otherPersonRepresentors,{otherPersonLandmarkFiles(j).name});
        currOtherPersonRepresentor = currOtherPersonRepresentor{1};%...
            %generateVectorMethod(histogramsPath, otherPersonImage, currLandmarksFilePath, z, M, P, sigma);

        % calculate hamming distance
        distances(k) = ...
            CalcHammingDistance(personRepresentor,currOtherPersonRepresentor);
        k = k+1;
    end
end

% % calc histogram
% [y,x] = hist(distances');
% f = figure('Visible','off');
% plot(y,x);
end