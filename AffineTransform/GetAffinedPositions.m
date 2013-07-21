function [ AffinedModel ] = GetAffinedPositions( transformationMatrix,BeforeAffineModel)
%GETAFFINEDPOSITIONS return an affined version of a supplied model.
%The affine model us generated using the given transformation matrix.

%Set the initial Affine Model to be the current model
AffinedModel = BeforeAffineModel;

%Now all we need to do is to multiply the positions with the transformation
%matrix
UpperLeftPositions = AffinedModel.xy(:,1:2);
LowerRightPositions = AffinedModel.xy(:,3:4);

%Insert third column to the Before matrix to add free coficients
UpperLeftPositions = [UpperLeftPositions ones(size(UpperLeftPositions,1),1)];
LowerRightPositions = [LowerRightPositions ones(size(LowerRightPositions,1),1)];

%Multiply the positions with the transformation matrix
UpperLeftPositions = UpperLeftPositions*transformationMatrix;
LowerRightPositions = LowerRightPositions*transformationMatrix;

%Update the model
AffinedModel.xy(:,1:2) = UpperLeftPositions;
AffinedModel.xy(:,3:4) = LowerRightPositions;

end

