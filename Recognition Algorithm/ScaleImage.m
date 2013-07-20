function [ ScaledImg ] = ScaleImage( InputImg , size )
%SCALEIMAGE - Scale the input image to the specified size or to the default
%size specified in the configuration file

%if the size parameter doesn't set we get it from the configuration file
if (nargin < 2)
    size = str2double(FindGeneralConfiguration('ImageSizeDim1'));
end

%Taking the first dimension of the image
currentSize = size(InputImg,1);

%scaling the image accoding to the specified ratio of the first dimension
ScaledImg = imresize(InputImg,size/currentSize);

end

