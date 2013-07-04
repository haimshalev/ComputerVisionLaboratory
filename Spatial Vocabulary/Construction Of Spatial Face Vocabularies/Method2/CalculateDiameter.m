function diameter = CalculateDiameter( landmarks, polygon )
% INPUT : 
%           landmarks k x 2 (k - number of landmarks)
%           polygon is a vector<LandmarkIndex>

% OUTPUT : 
%           diameter - the area of the polygon in the landmarks' positions

N = length(polygon);

diameter = 0;

for i=1:N
    landmarkIndex = polygon(i);
    nextLandmarkIndex = polygon(mod(i, N)+1);
    
    currX = landmarks(landmarkIndex, 1);
    currY = landmarks(landmarkIndex, 2);
    nextX = landmarks(nextLandmarkIndex, 1);
    nextY = landmarks(nextLandmarkIndex, 2);
    
    diameter = diameter + ...
        sqrt((currX - nextX)^2 + (currY - nextY)^2);
end

end

