function [  ] = InitializeRecognizer( )
%INITIALIZERECOGNIZER - Initalize all the data needed for the algorithm

%Initalize Train DB
GenerateTrainDB();

%Train and create Histogram of Spatial bins
Method1Train(GetTrainDBPath(),GetHistogramsPath());

end

