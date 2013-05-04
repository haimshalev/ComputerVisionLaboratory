function [PositionMatrix] = GetPositionsMatrix(model)
%GetPositionsMatrix returnes the position matrix (numberofLandmarks X 2) of a
%modedl

%initialize the Position matrix
%Creating a zeroed matrix with the number of LandmarkPositions X 2
PositionMatrix = zeros(size(model.xy,1) , 2);

%for each landmark found by the landmark detector
for i = 1:1:size(model.xy,1);
    
        %Getting the current box positions
        x1 = model.xy(i,1);
        y1 = model.xy(i,2);
        x2 = model.xy(i,3);
        y2 = model.xy(i,4);
        
        %Calculating the Landmark position and inert the position into the
        %position matrix
        PositionMatrix(i,1) = ceil((x1 + x2)/2);
        PositionMatrix(i,2) = ceil((y1 + y2)/2);
                
end

end

