function [ EnabledLandmarks ] = ChooseEnabledLandmarks( )
%ChooseEnabledLandmarks - return a vector with 68 cells 
%every cell as a logical value which  : 0 - the landmark is disabled
%                                     : 1 - the landmark is enabled

%Initialize the output vector
EnabledLandmarks  = zeros(68,1);

%Left mouth
EnabledLandmarks(50) = 1;

%Right mouth
EnabledLandmarks(41) = 1; 

%Right eye
EnabledLandmarks(25) = 1;

%Left eye
EnabledLandmarks(11) = 1; 

%Nose
EnabledLandmarks(4) = 1;

%Convert the matrix to logical
EnabledLandmarks = logical(EnabledLandmarks);

end

