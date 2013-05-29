function [PersonVector] =  CreatePersonVector( PersonImg )
%CreatePersonVector - Creates the input person's Vector

disp('***CreatePersonVector - Started***');

%Detect Landmark in the image
ImageModel = DetectLandmarks(PersonImg);

% Create the landmarks positions matrix
PositionsMatrix = GetPositionsMatrix(ImageModel);

%Get the Affine transform model
AffinedModel = GetAffineModel();

% Apply affine Transform to the predifined model
AffinedImg = ApplyAffineTransform(PersonImg,AffinedModel);

%Detect Landmark in the Affine Transformed image
AffineImageModel = DetectLandmarks(AffinedImg);

% Create the landmarks positions matrix
AffinePositionsMatrix = GetPositionsMatrix(AffineImageModel);

%Initialize the person Vector
PersonVector = [];

%Create an appearence representation vector 

%Generate spatial vector representation and Concat it to the other representations
PersonVector = [PersonVector ; GenerateSpatialRepresentation(PositionsMatrix)];

disp('***CreatePersonVector - Ended***');

end