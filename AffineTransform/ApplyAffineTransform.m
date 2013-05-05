function [] = ApplyAffineTransform( srcImage , AffinedModel , TransformedImageName )
%TransformImage apply a affine transform on a 3 dimensional Image to match
%the supplied AffinedModel. Than, save the new image in the variable which name
%was chosen by the third parameter

%Display the source image
clf; imagesc(srcImage); axis image; axis off; drawnow;title('Source Image');

disp('...');
disp('Press any key to add the model landmarks to the image');
disp('...');
pause;

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
outImage = step(htrans, singlePrecisionImg ,singlePrecisionTMatrix); 

%Convert the output image back to uint8
outImage = im2uint8(outImage);

%Show the transformed Image
figure,imshow(outImage),title('The Image after affined Transformation');

disp('...');
disp('Press any key to add the model landmarks to the transformed image');
disp('...');
pause;


%Display the Affined Model landmarks
showboxes(outImage,AffinedModel),title('The Image after affined Transformation with the model Landmark');

disp('Finshed affine transformation.');

%save the transformed image to a workspace variable
assignin('base', TransformedImageName, outImage);
end

