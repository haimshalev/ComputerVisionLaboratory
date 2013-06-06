function [TrainDBPath] = GetTrainDBPath()
%GetTrainDBPath - returns the train db file path

%Gets the TrainDB file path from configuration
TrainDBPath = FindSubProjectConfiguration('GenerateTrainDB','TrainDBFilePath');

end