function [faceAppearanceRepresentor] = Method1GenerateVector( histogramsPath,image, landmarksPath, z, M, P, sigma)

if (nargin < 4)
    z = 5;
end

if (nargin < 5)
    M = 36;
end

if (nargin < 6)
    P = [6  32  15  51  52  9  35  59  10 16 18 1 20 13 12 53 3 7 17 36];
end

if (nargin < 7)
    sigma = 6;
end

% histograms is a k x Q x 2 - 
% first dim is the landmarks
% second dim is the center of bins,
% third dim is the number of instances in each bin
load(histogramsPath);

% landmarks is k x 2
load(landmarksPath);

% landmarks is k x 2
% landmarksHistograms is k x t x 128
[k,~] = size(currOutput);

faceAppearanceRepresentor = Method1InternalGenerateVector(currOutput, histograms, z, image, M, P, sigma);

end

