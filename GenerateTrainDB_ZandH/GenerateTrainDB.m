function [ TrainDB ] = GenerateTrainDB(SourceTrainDBPath)
    
    fileList = GetAllFilesSpecificType(SourceTrainDBPath,'jpg');
       
    [fileListSize,~] = size(fileList);
    TrainDB = [];
    for i=1:fileListSize
        CurrentFileName = fileList(i);
        CurrentPerson = imread(CurrentFileName{1});
        
        %Detect Landmark in the image
        ImageModel = DetectLandmarks(CurrentPerson);
        % Create the landmarks positions matrix
        PositionsMatrix = GetPositionsMatrix(ImageModel);
        
        TrainDB(i,:,:) = PositionsMatrix;
    end
end