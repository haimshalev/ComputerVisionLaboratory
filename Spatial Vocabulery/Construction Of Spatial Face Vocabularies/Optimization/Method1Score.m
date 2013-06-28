function score = Method1Score( intraDistances, interDistances, representorLength )
%METHOD1SCORE Summary of this function goes here
%   Detailed explanation goes here

[interDistancesBinsCounts, interDistancesBinsCenters] = hist(interDistances');
[intraDistancesBinsCounts, intraDistancesBinsCenters] = hist(intraDistances');

interDistancesBinsCounts = NormalizeVector(interDistancesBinsCounts);
interDistancesCenterOfGravity = ...
    sum(interDistancesBinsCounts.*interDistancesBinsCenters)/sum(interDistancesBinsCounts);
interDistancesEdges = min(interDistancesBinsCenters(interDistancesBinsCounts > 0));

intraDistancesBinsCenters = intraDistancesBinsCenters(intraDistancesBinsCounts > 0);
intraDistancesBinsCounts = intraDistancesBinsCounts(intraDistancesBinsCounts > 0);
intraDistancesBinsCounts = NormalizeVector(intraDistancesBinsCounts);
intraDistancesCenterOfGravity = ...
    sum(intraDistancesBinsCounts.*intraDistancesBinsCenters)/sum(intraDistancesBinsCounts);
intraDistancesEdges = max(intraDistancesBinsCenters(intraDistancesBinsCounts > 0));

centerOfGravityDistance = interDistancesCenterOfGravity - intraDistancesCenterOfGravity;
edgesDistance = interDistancesEdges - intraDistancesEdges;
    
score = centerOfGravityDistance/representorLength + edgesDistance/representorLength;
end

