function [ faceAppearanceRepresentor ] = GenerateAppearanceRepresentation1( image, positionMatrix )
%Generate appearance vector representation using method 1 and return it

%Get the histograms path
histogramsPath = GetHistogramsPath();

% histograms is a k x Q x 2 - 
% first dim is the landmarks
% second dim is the center of bins,
% third dim is the number of instances in each bin
load(histogramsPath);

%Set all the representation default prefrences
z = 5;
M = 36;
P = [6  32  15  51  52  9  35  59  10 16 18 1 20 13 12 53 3 7 17 36];
sigma = 6;

%Create the representation using inner function using all the loaded
%parameters
faceAppearanceRepresentor = Method1InternalGenerateVector(positionMatrix, histograms, z, image, M, P, sigma);

end
