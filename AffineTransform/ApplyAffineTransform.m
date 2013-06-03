function [TransformedImage] = ApplyAffineTransform( srcImage , AffinedModel )
%TransformImage apply a affine transform on a 3 dimensional Image to match
%the supplied AffinedModel. Than, save the new image in the variable which name
%was chosen by the third parameter

%Display the source image
figure;clf; imagesc(srcImage); axis image; axis off; drawnow;title('Source Image');

%Display the Affined Model landmarks
showboxes(srcImage,AffinedModel),title('The Image before affine Transformation with the model Landmark');

%Create the affine transformation matrix
transformationMatrix = CreateAffineTransformationMatrix(srcImage , AffinedModel );

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

%Show the transformed Image
figure,imshow(TransformedImage),title('The Image after affined Transformation');


%Display the Affined Model landmarks
showboxes(TransformedImage,AffinedModel),title('The Image after affined Transformation with the model Landmark');

disp('Finshed affine transformation.');

end

