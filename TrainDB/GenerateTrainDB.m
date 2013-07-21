function [ TrainDB , PatchesTrainDB , TrainImages] = GenerateTrainDB(SourceTrainDBPath)
    
disp('---- Generate Train DB ----');

    fileList = GetAllFilesSpecificType(SourceTrainDBPath,'jpg');
       
    [fileListSize,~] = size(fileList);
    TrainDB = [];
    PatchesTrainDB = [];
    
    
    for i=1:fileListSize
        
        CurrentFileName = fileList(i);
        
        fprintf(2,'Detection number: %d ,Current image Name: %s\n',i,CurrentFileName{1}); 
        
        CurrentPerson = ScaledImRead(CurrentFileName{1});

        %Detect Landmark in the image
        ImageModel = DetectLandmarks(CurrentPerson);
        % Create the landmarks positions matrix
        PositionsMatrix = GetPositionsMatrix(ImageModel);
        % Create the patches matrix
        PatchesMatrix = GetPatchesMatrix(ImageModel);
        
        TrainDB(i,:,:) = PositionsMatrix;
        PatchesTrainDB(i,:,:) = PatchesMatrix;
        TrainImages{i} =  (CurrentPerson);
        
    end
    
disp('---- Generate Train DB succeeded ----');
    
end