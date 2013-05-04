function [ H ] = CreateAffineTransformationMatrix(srcImage , AffinedModel )
%Affine Transformation take source image and a model (landmark positions struct) and
%create a transformation matrix from the source image landmark model to the
%affined model

%{
    We need to find the matrix H = [h1 h2 h3 ; h4 h5 h6]
    which transform every point (x,y) to a new point (x*,y*) which :

    x* = xh1 + yh2 + h3
    y* = xh4 + xh5 + h6

    those x* and y* should be at the landmark positions of the affined
    transform image
%}

%% Step 1 : Detect the facial landmarks positions in the srcImage 

BeforeAffineModel = DetectLandmarks(srcImage);

%% Step 2 : Build the positions matrix of the of the Affine transformed model

disp ('Creating an affine transformation matrix ...');

AfterAffineTransformationLandmarkPositions = GetPositionsMatrix(AffinedModel);

%% Step 3 : Build the positions matrix of the current model

BeforeAffineTransformationLandmarkPositions = GetPositionsMatrix(BeforeAffineModel);

%% Step 4 : Find the affine transformation matrix H

%Insert third column to the Before matrix to add free coficients
BeforeAffineTransformationLandmarkPositions = [BeforeAffineTransformationLandmarkPositions ones(size(BeforeAffineTransformationLandmarkPositions,1),1)];

%Solve the equation BeforeMatrix*H = AfterAffine  and fine H
H = linsolve(BeforeAffineTransformationLandmarkPositions , AfterAffineTransformationLandmarkPositions);

disp ('Affine Transformation matrix was successfully created  ...');
end