function [ model ] = DetectLandmarks(srcImg , CustomLandmarks)

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

% % Pre-trained model with 99 parts. Works best for faces larger than 150*150
% load face_p99.mat

% % Pre-trained model with 1050 parts. Give best performance on localization, but very slow
% load multipie_independent.mat

% 5 levels for each octave
model.interval = 5;
% set up the threshold
model.thresh = min(-0.65, model.thresh);

% define the mapping from view-specific mixture id to viewpoint
if length(model.components)==13 
    posemap = 90:-15:-90;
elseif length(model.components)==18
    posemap = [90:-15:15 0 0 0 0 0 0 -15:-15:-90];
else
    error('Can not recognize this model');
end

%% Detecting stage

disp('Starting detection of facial landmarks in the source image..');

%start a timer 
tic;

%detect the model best fit to the picture 
model = detect(srcImg, model, model.thresh);
model = clipboxes(srcImg, model);

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

% show highest scoring detection and performance
figure,showboxes(srcImg, model(1)),title('Highest scoring detection');
fprintf('Detection took %.1f seconds\n',dettime);

disp('Detection Finished , A facial model was created');

end

