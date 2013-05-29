function [ AffineModel ] = GetAffineModel( )
%GETAFFINEMODEL - Returns the saved affine model

%TODO - Get path from configuration file

%Get the model path
modelPath = 'AffineTransform/AffineModel.mat';

%Load the Affine Model 
AffineModel = load(modelPath);
AffineModel = AffineModel.AffineModel;

end

