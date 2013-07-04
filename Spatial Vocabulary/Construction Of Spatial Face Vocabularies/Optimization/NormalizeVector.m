function normalizedVector = NormalizeVector( vector )
%NORMALIZEVECTOR Summary of this function goes here
%   Detailed explanation goes here

vectorMin = min(vector);
vectorMax = max(vector);
range = vectorMax - vectorMin;

if range == 0
    normalizedVector = vector/vectorMax;
else
    normalizedVector = (vector - vectorMin)/range;
end

end

