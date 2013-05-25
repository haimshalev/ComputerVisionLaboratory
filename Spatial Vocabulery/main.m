clc

histogramsPath = 'TrainDB/histograms.mat';
dbPath = 'TrainDB/globalDB.mat';

% train
%Method1Train(dbPath,histogramsPath);

% Generate a vector  

%Output of the landmark detector after GetPosition Matrix
landmarksPath = 'TrainDB/s01/01.jpg.1.mat';
Method1GenerateVector(histogramsPath, landmarksPath);