function [ TrainDB , TrainImages , AffineTrainDB , TrainAffineImages ] = GenerateTrainDB(SourceTrainDBPath)
    
disp('---- Generate Train DB ----');

    fileList = GetAllFilesSpecificType(SourceTrainDBPath,'jpg');
       
    [fileListSize,~] = size(fileList);
    TrainDB = [];
    
    
    for i=1:fileListSize
        
        CurrentFileName = fileList(i);
        
        fprintf(2,'Detection number: %d ,Current image Name: %s\n',i,CurrentFileName{1}); 
        
        CurrentPerson = ScaledImRead(CurrentFileName{1});

        %Detect Landmark in the image
        ImageModel = DetectLandmarks(CurrentPerson);
        % Create the landmarks positions matrix
        PositionsMatrix = GetPositionsMatrix(ImageModel);
        
        TrainDB(i,:,:) = PositionsMatrix;
        TrainImages{i} =  (CurrentPerson);
        
        %% Apply Affine Transform 
    
        %Get the Affine transform model
        AffinedModel = GetAffineModel();

        % Apply affine Transform to the predifined model
        [AffinedImg , AffineImageModel]= ApplyAffineTransform(CurrentPerson,AffinedModel,ImageModel);

        % Create the landmarks positions matrix
        AffinePositionsMatrix = GetPositionsMatrix(AffineImageModel);
        
        AffineTrainDB(i,:,:) = AffinePositionsMatrix;
        TrainAffineImages{i} = (AffinedImg);
        
    end
    
disp('---- Generate Train DB succeeded ----');
    
end