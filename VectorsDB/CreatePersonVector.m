function [PersonVector] =  CreatePersonVector( PersonImg )
%CreatePersonVector - Creates the input person's Vector

disp('***CreatePersonVector - Started***');

%% Detect Landmark in the image
ImageModel = DetectLandmarks(PersonImg);

% Create the landmarks positions matrix
PositionsMatrix = GetPositionsMatrix(ImageModel);

%{

TODO : Add this code when Toni's part is done

%Get the Affine transform model
AffinedModel = GetAffineModel();

% Apply affine Transform to the predifined model
AffinedImg = ApplyAffineTransform(PersonImg,AffinedModel);

%Detect Landmark in the Affine Transformed image
AffineImageModel = DetectLandmarks(AffinedImg);

% Create the landmarks positions matrix
AffinePositionsMatrix = GetPositionsMatrix(AffineImageModel);
%}

%Initialize the person Vector
PersonVector = [];

%% Generate an appearence representation and Concat it to the other representations

if (strcmp(FindSubProjectConfiguration('AppearanceVocabulary','enabled'),'true'))
    
    %The spatial vocabulary code have some functions with the same name of the
    %functions in the appearance vocabulary, so each time we use one of the
    %vocabularies functions we need to specify which one we use.
    UseAppearanceVocabulary();  
    PersonVector = [PersonVector ; GenerateAppearanceRepresentation1(PersonImg , PositionsMatrix)];

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