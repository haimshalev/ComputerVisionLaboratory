function [TransformedImage , TransformedModel] = ApplyAffineTransform( srcImage , AffinedModel , InputImageModel)
%TransformImage apply a affine transform on a 3 dimensional Image to match
%the supplied AffinedModel. Returns the transformed image and model

%Create the affine transformation matrix
if (nargin == 3)
    [transformationMatrix , BeforeAffineModel]= CreateAffineTransformationMatrix(srcImage , AffinedModel , InputImageModel);
else
    [transformationMatrix , BeforeAffineModel]= CreateAffineTransformationMatrix(srcImage , AffinedModel);
end

disp('Creating affined transformed image which match the input model...');

%initialize a geometricTransformer helper instance
htrans = vision.GeometricTransformer;

%Convert both image and tranformation matrix from uint8 to single
%precision(required by the step function)
singlePrecisionImg = im2single(srcImage);
singlePrecisionTMatrix = im2single(transformationMatrix);

%Apply geometric transform to the src image
TransformedImage = step(htrans, singlePrecisionImg ,singlePrecisionTMatrix); 

%Convert the output image back to uint8
TransformedImage = im2uint8(TransformedImage);

%Create the transformed model - this is proximetly the affined model
TransformedModel = GetAffinedPositions(transformationMatrix,BeforeAffineModel);

disp('Finshed affine transformation.');

end

