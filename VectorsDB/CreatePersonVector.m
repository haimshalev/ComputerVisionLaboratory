function [PersonVector] =  CreatePersonVector( PersonImg )
%CreatePersonVector - Creates the input person's Vector

disp('***CreatePersonVector - Started***');

%% Detect Landmark in the image
ImageModel = DetectLandmarks(PersonImg);

% Create the landmarks positions matrix
PositionsMatrix = GetPositionsMatrix(ImageModel);

%Initialize the person Vector
PersonVector = [];

%% Generate an appearence representation and Concat it to the other representations

if (strcmp(FindSubProjectConfiguration('AppearanceVocabulary','enabled'),'true'))
    
    %The spatial vocabulary code have some functions with the same name of the
    %functions in the appearance vocabulary, so each time we use one of the
    %vocabularies functions we need to specify which one we use.
    UseAppearanceVocabulary();  
    

    if (strcmp(FindSubProjectConfiguration('AppearanceVocabulary','UseAffineTransform'),'true'))
    %% Apply Affine Transform 
    
        %Get the Affine transform model
        AffinedModel = GetAffineModel();

        % Apply affine Transform to the predifined model
        [AffinedImg , AffineImageModel] = ApplyAffineTransform(PersonImg,AffinedModel,ImageModel);

        % Create the landmarks positions matrix
        AffinePositionsMatrix = GetPositionsMatrix(AffineImageModel);
        
        PersonVector = [PersonVector ; GenerateAppearanceRepresentation1(AffinedImg , AffinePositionsMatrix)];

    else
        PersonVector = [PersonVector ; GenerateAppearanceRepresentation1(PersonImg , PositionsMatrix)];
    end

end

%% Generate spatial vector representation and Concat it to the other representations

if (strcmp(FindSubProjectConfiguration('SpatialVocabulary','enabled'),'true'))
    
    %The spatial vocabulary code have some functions with the same name of the
    %functions in the appearance vocabulary, so each time we use one of the
    %vocabularies functions we need to specify which one we use.
    UseSpatialVocabulary();

    PersonVector = [PersonVector ; GenerateSpatialRepresentation(PositionsMatrix)];
end 

disp('***CreatePersonVector - Ended***');

end