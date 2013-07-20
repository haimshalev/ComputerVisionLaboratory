function [ images ] = GetImagesDB( imagesDBPath )
%GETIMAGESDB Summary of this function goes here
%   Detailed explanation goes here
imagesSoFar = 0;
ims = dir(imagesDBPath);
for i = 1:length(ims) - 2 ,
%     if ~ims(i).isdir
        imagesSoFar = imagesSoFar+1;
        im_orig = imread([imagesDBPath '/' num2str(imagesSoFar) '.jpg']);
        
        faceImage = im_orig;
        images{imagesSoFar} = faceImage;
%     end
end

end

