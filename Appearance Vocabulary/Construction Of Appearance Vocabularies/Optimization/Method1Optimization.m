clc
clear all
close all

addpath ../Method1

% optimization per landmark - find the Q and z that give the best score
bestScore = -Inf;
bestQ = -1;
bestz = -1;
bestt = -1;
bestM = -1;
bestSigma = -1;
bestUseCentroids = -1;

alignedImages = false;
if(alignedImages)
    basePath = strcat('../..\FaceDBLandmarks\GT Affine Transformed Colored\Georgia Tech\');
    dbPath = '../..\face-release1.0-basic\output\FaceDB\GT Affine Transformed Colored - Trimmed\globalDB.mat';
else
    testBasePath = strcat('../..\FaceDBLandmarks\OriginalImages\Georgia Tech\');
    testImagesPath = '../../FaceDB\OriginalImages\Georgia Tech\Images\';
    
%     dbPath = '../../FaceDBLandmarks/OriginalImages/Georgia Tech/globalDB.mat';
%     dbPath = 'C:\develop\LabInCV-Appearance\FaceDB\BigDB\patch_init.mat';
    load('../../FaceDB\BigDB\positionsDB.mat');
    trainingDBImages = GetImagesDB('C:\develop\LabInCV-Appearance\FaceDB\BigDB\AllImages');
end

% landmarksIndices = [59, 54, 61, 66, 27, 31, 20, 16,...
%     7, 3, 5, 35, 41, 32, 51, 15, 10, 21, 26];

% left side:
% landmarksIndices = [59, 54, 20, 16,...
%      3, 35, 51, 15, 10];

% right side:
% landmarksIndices = [61, 66, 27, 31,...
%      5, 41, 51, 21, 26];
 
% best of right side and left side:
% landmarksIndices = [61, 66, 27, 31,...
%      41, 51, 59  54  16  35  51  10];

landmarksIndices = [6  32  15  51  52  9 35  59  10 16 18 1 20 13 12 53 3 7 17 36];
% landmarksIndices = [47];
Qs = 50;%50;%40:10:60;%38:3:44;
ts = 30;%[28,30,31];
zs = 5;%2:1:5;%[9 11 13];
Ms = 36;%30:10:60;%36;%34:2:38;
sigmas = 6;%5.5;%4.5:0.5:5.5;%5.5:0.5:6.5;
useCentroids = false;%[true,false];
% 
% Qs =50;
% zs =12;
% landmarksIndices =[6  32  15  51  52  27   9  41  35  59  10];
% ts =25;
% Ms =30;
% useCentroids =1;
% sigmas =8;

scores = zeros(length(Qs), length(zs), 2^length(landmarksIndices)-1,length(ts), length(Ms), length(sigmas), length(useCentroids));

landmarksPowerset = PowerSet(landmarksIndices);

r = 1;
for i=length(landmarksPowerset):length(landmarksPowerset)
    [rows, ~] = size(landmarksPowerset{i});
    
    for j=1:rows
        P = landmarksPowerset{i}(j, :);
        
        c1=1;
        for Q = Qs
            k=1;
            for t = ts
                if (t >= Q)
                    continue;
                end
                c2=1;
                for z = zs
                    if (z >= t)
                        continue;
                    end
                    c3=1;
                    for M = Ms
                        c4=1;
                        for sigma = sigmas
                            c5=1;
                            for useCentroid = useCentroids
                                % calc score
                                disp(strcat('Q = ', num2str(Q)));
                                disp(strcat('z = ', num2str(z)));
                                disp(strcat('P = ', num2str(P)));
                                disp(strcat('t = ', num2str(t)));
                                disp(strcat('M = ', num2str(M)));
                                disp(strcat('useCentroid = ', num2str(useCentroid)));
                                disp(strcat('sigma = ', num2str(sigma)));
                                score = ...
                                    ParametersScore(Q, z, P, t, M, sigma, useCentroid, ...
                                                    @Method1Train, @Method1GenerateVector,...
                                                    1, testBasePath, globalDBout, testImagesPath, trainingDBImages);
                                scores(c1, k, r, c2, c3, c4, c5) = score;
                                disp(strcat('score = ', num2str(score)));
                                fprintf('\n');
                                % check if these Q and z have better score
                                if (score > bestScore)
                                    bestScore = score;
                                    bestQ = Q;
                                    bestz = z;
                                    bestP = P;
                                    bestt = t;
                                    bestM = M;
                                    bestSigma = sigma;
                                    bestUseCentroid = useCentroid;
                                end
                                c5 = c5 + 1;
                            end
                            c4 = c4 + 1;
                        end
                        c3 = c3 + 1;
                    end
                    c2 = c2 + 1;
                end
                k = k + 1;
            end
            c1 = c1+1;
        end
        r = r + 1;
    end
end

disp(strcat('best Q = ', num2str(bestQ)));
disp(strcat('best z = ', num2str(bestz)));
disp(strcat('best P = ', num2str(bestP)));
disp(strcat('best t = ', num2str(bestt)));
disp(strcat('best M = ', num2str(bestM)));
disp(strcat('best use centroid = ', num2str(bestUseCentroid)));
disp(strcat('best sigma = ', num2str(bestSigma)));
disp(strcat('best score = ', num2str(bestScore)));

save('Method1ParametersScores', 'scores', 'Qs', 'zs', 'landmarksPowerset', 'ts', 'Ms', 'useCentroids', 'sigmas');
