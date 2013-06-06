function [ enabledLand ] = GetEnabledLandmarksPath( )
%GetEnabledLandmarksPath - Returns the enabled landmarks matrix path

%Gets the enabledLandmark matrix path from configuration
enabledLand = FindSubProjectConfiguration('AffineTransform','EnabledLandmarksPath');

end
