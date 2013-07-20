function [] = TrainSpatialVocabulary()
%TRAINSPATIALVOCABULARY - a wrapper function to all the spatial vocabulary
%train functions

%Get the output path of the positions matrix of the train db
positionsPath = FindSubProjectConfiguration('TrainDB','PositionsTrainDBFilePath');

%Gets the histogram file path from configuration
histogramsPath = GetHistogramsPath();


%Switch over the available methods
switch (str2double(FindSubProjectConfiguration('SpatialVocabulary','Method')))
    case (1)
        Method1Train(positionsPath,histogramsPath);
    case (2)
        Method2Train(positionsPath,histogramsPath);
    otherwise
        error('The chosen spatial representaion method is unavailabe. Please choose an enabled method and restart program');
end

end

