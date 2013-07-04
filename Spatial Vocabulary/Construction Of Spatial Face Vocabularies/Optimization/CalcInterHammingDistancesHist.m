function distances = CalcInterHammingDistancesHist(basePath,personId,...
                                     histogramsPath,generateVectorMethod,z, P, otherPeopleId)

if (nargin < 7)
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
personDir = strcat(basePath, personId);
personLandmarkFiles = dir(strcat(personDir,'/*.mat'));
% skipping the '.' and '..' files
firstLandmarksFilePath = strcat(personDir,'/',personLandmarkFiles(3).name);

% calculate the person vector
personRepresentor = ...
    generateVectorMethod(histogramsPath, firstLandmarksFilePath, z, P);

[l, ~] = size(otherPeopleId);
k = 1;
for i=1:l
    
    % get all the current other person's images
    otherPersonDir = strcat(basePath,otherPeopleId(i,:));
    otherPersonLandmarkFiles = dir(strcat(otherPersonDir,'/*.mat'));
    
    for j=1:length(otherPersonLandmarkFiles)
        
        % calculate the current other person vector
        currLandmarksFilePath = ...
            strcat(otherPersonDir,'/',otherPersonLandmarkFiles(j).name);
        currOtherPersonRepresentor = ...
            generateVectorMethod(histogramsPath, currLandmarksFilePath, z, P);

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