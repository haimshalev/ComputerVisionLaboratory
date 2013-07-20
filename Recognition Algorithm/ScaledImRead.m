function [ scaledImage ] = ScaledImRead( imagePath , size )
%SCALEDIMREAD - Read an image and return a scaled version of it - Need to
%use this function when reading an image related to this project

%Return a scaled image 
if (nargin == 2)
    scaledImage = ScaleImage(imread(imagePath),size);
else
    scaledImage = ScaleImage(imread(imagePath));

end

