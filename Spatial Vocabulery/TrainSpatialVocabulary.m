function [] = TrainSpatialVocabulary( dbpath, histogramsPath)
%TRAINSPATIALVOCABULARY - a wrapper function to all the spatial vocabulary
%train functions

%Switch over the available methods
switch (str2double(FindSubProjectConfiguration('SpatialVocabulary','Method')))
    case (1)
        Method1Train(dbpath,histogramsPath);
    case (2)
        Method2Train(dbpath,histogramsPath);
    otherwise
        error('The chosen spatial representaion method is unavailabe. Please choose an enabled method and restart program');
end

end

