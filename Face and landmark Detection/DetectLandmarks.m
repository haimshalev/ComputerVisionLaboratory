function [ model ] = DetectLandmarks(srcImg , CustomLandmarks , showFigures)

if (nargin < 3)
    showFigures =  false;
end

%On default beavior enable all landmarks
if (nargin == 1)
    CustomLandmarks = 0;
end

%DetectLandmarks get an image and try to detect facial landmarks using the
%face detector and landmarks finder engine 

%If landmarks found this functions ouput the best scored model describing
%the face in the image

%% Load detection model and create pose map

% load and visualize model
% Pre-trained model with 146 parts. Works best for faces larger than 80*80
load face_p146_small.mat

% 5 levels for each octave
model.interval = 5;
% set up the threshold
model.thresh = min(-0.65, model.thresh);

%% Scaling stage

%Scale the input image if necessery

%Gets the maximum size of rows in the image from configuration file
maxSize = str2double(FindSubProjectConfiguration('FaceAndLandmarkDetection','MaxImageSizeDim1'));
currentSize = size(srcImg,1);
scaledImg = imresize(srcImg,maxSize/currentSize);

%% Detecting stage

disp('Starting detection of facial landmarks in the source image..');

%start a timer 
tic;

%detect the model best fit to the picture 
model = detect(scaledImg, model, model.thresh);
model = clipboxes(scaledImg, model);

%Suppress the results - only take the high scoring detections and skip
%detections that are significantly covered by  a previously selected
%detections
model = nms_face(model,0.3);

%stop the timer
dettime = toc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Remove all the disabled Landmarks

if (CustomLandmarks == 1)
    %Load the Enabled Landmarks matrix
    EnabledLandmarksMatrix = load(GetEnabledLandmarksPath());
    EnabledLandmarksMatrix = EnabledLandmarksMatrix.EnabledLandmarks;

    %Remove all the disabled landmarks
    model(1).xy = model(1).xy(EnabledLandmarksMatrix,:);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Scale the results to the original image
model(1).xy = model(1).xy .* (currentSize/maxSize);

%Save the model original size
model(1).size = size(srcImg);

% show highest scoring detection and performance
if (showFigures == true)
    figure,showboxes(srcImg, model(1)),title('Highest scoring detection');
end

fprintf('Detection took %.1f seconds\n',dettime);

disp('Detection Finished , A facial model was created');

end

