function [ PatchesMatrix ] = GetPatchesMatrix( model )
%GETPATCHESMATRIX returns the patches matrix (numberofLandmarks X 4 ) of a
%model.

%Return the patches matrix (numberofLandmarks X 4) 
%column1 = upperleft X , column2 =upperleft Y 
%column3=lowerright X and column4 = lowerright Y
PatchesMatrix = model.xy;

end
