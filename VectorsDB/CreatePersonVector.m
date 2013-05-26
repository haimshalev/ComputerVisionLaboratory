function [PersonVector] =  CreatePersonVector( PersonImg )
%CreatePersonVector - Creates the input person's Vector

%Get the Affine transform model
AffinedModel = GetAffineModel();

% Apply affine Transform to the predifined model
AffinedImg = ApplyAffineTransform(PersonImg,AffinedModel);

%Detect Landmark in the Affine Transformed image
ImageModel = DetectLandmarks(AffinedImg);

% Create the landmarks positions matrix
PositionsMatrix = GetPositionsMatrix(ImageModel);

%Initialize the person Vector
PersonVector = [];

%Create an appearence representation vector 

%Generate spatial vector representation and Concat it to the other representations
PersonVector = [PersonVector ; GenerateSpatialRepresentation(PositionsMatrix)];

end