function [ TrainDB ] = GenerateTrainDB(SourceTrainDBPath)
    
disp('---- Generate Train DB ----');

    fileList = GetAllFilesSpecificType(SourceTrainDBPath,'jpg');
       
    [fileListSize,~] = size(fileList);
    TrainDB = [];
    
    
    for i=1:fileListSize
        
        CurrentFileName = fileList(i);
        
        fprintf(2,'Detection number: %d ,Current image Name: %s\n',i,CurrentFileName{1}); 
        
        CurrentPerson = imread(CurrentFileName{1});
        
        %Detect Landmark in the image
        ImageModel = DetectLandmarks(CurrentPerson);
        % Create the landmarks positions matrix
        PositionsMatrix = GetPositionsMatrix(ImageModel);
        
        TrainDB(i,:,:) = PositionsMatrix;
    end
    
disp('---- Generate Train DB succeeded ----');
    
end