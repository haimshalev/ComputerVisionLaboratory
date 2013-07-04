function [ratio,minSide,maxSide] = CalculateSidesRatio( landmarks, polygon )
% INPUT : 
%           landmarks k x 2 (k - number of landmarks)
%           polygon is a vector<LandmarkIndex>

% OUTPUT : 
%           ratio - the ratio of the longest and the shortest sides of the
%           polygon

N = length(polygon);

sidesLengths = zeros(N,1);
for i=1:N
    landmarkIndex = polygon(i);
    nextLandmarkIndex = polygon(mod(i, N)+1);
    
    currX = landmarks(landmarkIndex, 1);
    currY = landmarks(landmarkIndex, 2);
    nextX = landmarks(nextLandmarkIndex, 1);
    nextY = landmarks(nextLandmarkIndex, 2);
    
    sidesLengths(i) = ...
        sqrt((currX - nextX)^2 + (currY - nextY)^2);
end

minSide = double(min(sidesLengths));
maxSide = double(max(sidesLengths));
ratio = maxSide /(minSide + eps);

end

