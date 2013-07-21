function [ outModel ] = RemoveDisabledLandmarks( model )

outModel = model;

%Remove all the disabled Landmarks

%Load the Enabled Landmarks matrix
EnabledLandmarksMatrix = load(GetEnabledLandmarksPath());
EnabledLandmarksMatrix = EnabledLandmarksMatrix.EnabledLandmarks;

%Remove all the disabled landmarks
outModel(1).xy = model(1).xy(EnabledLandmarksMatrix,:);

end

