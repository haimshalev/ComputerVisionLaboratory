function [ descriptor ] = CalculateDescriptor( I, landmarkLocation, M, sigma )

grayImage = rgb2gray(I);

% descriptor - 128 x 1
y = landmarkLocation(1,2);
x = landmarkLocation(1,1);

if (mod(M,2) == 0)
    half = M/2;
else
    half = (M+1)/2;
end

landmarksPatch = imcrop(grayImage,[x-half,y-half,M,M]);
landmarksPatchSmooth = imsmooth(double(landmarksPatch)/256,sigma);

[R,C] = size(landmarksPatchSmooth);
midX = floor(C/2);
midY = floor(R/2);

% -pi/2 : the patch is not rotated
P = [midX; midY; -pi/2];
descriptor = siftdescriptor(landmarksPatchSmooth,P,sigma);

end

