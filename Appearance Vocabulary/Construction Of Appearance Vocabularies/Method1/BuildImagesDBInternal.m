function [ imagesSoFar ] = BuildImagesDBInternal( folderName,imagesSoFar,outputFolder )
%BUILDIMAGESDBINTERNAL Summary of this function goes here
%   Detailed explanation goes here
ims = dir(strcat(folderName, '/*.jpg'));
for i = 1:length(ims),
    imagesSoFar = imagesSoFar+1;
    im_orig = imread([folderName '/' ims(i).name]);
    imwrite(im_orig,strcat(outputFolder,num2str(imagesSoFar),'.jpg'));
end

allSubfiles = dir(folderName);

for i = 1:length(allSubfiles)
    if allSubfiles(i).isdir && ~strcmp(allSubfiles(i).name, '.') && ~strcmp(allSubfiles(i).name, '..')
        imagesSoFar =...
            BuildImagesDBInternal(strcat(folderName, '/', allSubfiles(i).name),...
            imagesSoFar, outputFolder);
    end
end

