function [ modelPath ] = GetAffineModelPath( )
%GetAffineModelPath - Returns the affine model file path

%Gets the affine model file path from configuration
modelPath = FindSubProjectConfiguration('AffineTransform','AffineModelPath');

end

