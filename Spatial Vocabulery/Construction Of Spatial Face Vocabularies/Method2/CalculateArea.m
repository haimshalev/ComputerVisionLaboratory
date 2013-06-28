function area = CalculateArea( landmarks, polygon )
% INPUT : 
%           landmarks k x 2 (k - number of landmarks)
%           polygon is a vector<LandmarkIndex>

% OUTPUT : 
%           area - the area of the polygon in the landmarks' positions

N = length(polygon);
polygonXs = zeros(1, N);
polygonYs = zeros(1, N);

for i=1:N
    landmarkIndex = polygon(i);
    polygonXs(1, i) = landmarks(landmarkIndex, 1);
    polygonYs(1, i) = landmarks(landmarkIndex, 2);
end

area = polyarea(polygonXs, polygonYs);

end

