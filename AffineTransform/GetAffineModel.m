function [ AffineModel ] = GetAffineModel( )
%GETAFFINEMODEL - Returns the saved affine model

%Get the Affine Model file path
modelPath = GetAffineModelPath();

%Load the Affine Model 
AffineModel = load(modelPath);
AffineModel = AffineModel.AffineModel;

end

