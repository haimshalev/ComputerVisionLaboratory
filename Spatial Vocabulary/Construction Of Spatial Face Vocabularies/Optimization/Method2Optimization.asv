clc
clear all
close all

addpath ../Method2

% optimization per landmark - find the Q and z that give the best score
bestScore = -Inf;
bestQ = -1;
bestz = -1;
%short\long axis of polygon, length of longest side, centroid x, centriod y
properties = [1,2,3,5,6,7,8,9,10,11]; % 1 - area, 2 - diameter, 3 - sides ratio
properties = [1,2,6,7,8];
polygon1 = [3, 59, 56]; % left cheek
polygon2 = [5, 68, 65]; % right cheek
polygon3 = [9, 3, 5]; % nose
polygon4 = [32, 33, 34, 35, 48, 51, 46, 44, 41, 40, 39]; % mouth
polygon5 = [19, 15, 10]; % above left eye
polygon6 = [21, 26, 30]; % above right eye
polygon7 = [68, 67, 66, 65, 64, 63, 62, 61, 52, 53, 54, 55, 56, 57, 58,...
    59, 60, 16, 17, 18, 19, 20, 31, 30, 29, 28, 27]; % the face contour
polygon8 = [41, 44, 46, 51, 48, 35, 55, 54, 53, 52, 61, 62, 63]; % main chin polygon
polygon9 = [3, 2, 1, 4, 5, 41, 40, 39, 32, 33, 34, 35]; % are between nose and mouth

polygon10 = [27,28,29,30,31,21,22,23,26];%right eye and eyebrow
polygon11 = [10,11,12,15,16,17,18,19,20];%left eye and eyebrow
polygon12 = [32,33,34,35,48,51,46,44,41,40,39];%mouth

polygons = struct('polygonsVertices', {polygon1, polygon2, polygon3, ...
    polygon4, polygon5, polygon6, polygon7, polygon8, polygon9,...
    polygon10, polygon11, polygon12});


% polygons = struct('polygonsVertices', {polygon1,polygon4, polygon7, polygon8,polygon12});
polygons = struct('polygonsVertices', {polygon1,polygon4, polygon7, polygon8});

polygonsIndices = 1:length(polygons);

propertiesPowerset = PowerSet(properties);
polygonsIndicesPowerSet = PowerSet(polygonsIndices);

Qs = 30:10:60;
zs = 15:5:30;%15:5:25;
alignedImages = false;

scores = zeros(length(Qs), length(zs), ...
    (2^length(properties)-1), ( 2^length(polygons)-1));
r1 = 1;
for i1 = length(propertiesPowerset):length(propertiesPowerset)
    propertiesSets = propertiesPowerset{i1};
    [propertiesSetsRows, ~] = size(propertiesSets);
    for i3 = 1:propertiesSetsRows
        r2 = 1;
        for i2 = length(polygonsIndicesPowerSet):length(polygonsIndicesPowerSet)
            polygonsSets = polygonsIndicesPowerSet{i2};
            [polygonsSetsRows, ~] = size(polygonsSets);
            for i4=1:polygonsSetsRows

                currPropertySet = propertiesSets(i3,:);

                polygonsSetIndices = polygonsSets(i4,:);
                currPolygonsSet = struct('polygonsVertices', {});
                for i5=1:length(polygonsSetIndices)
                    currPolygonsSet(i5).polygonsVertices = polygons(polygonsSetIndices(i5)).polygonsVertices;
                end

                pIndex = 1;
                for i5=1:length(currPropertySet)
                    for i6=1:length(currPolygonsSet)
                        P(pIndex) = struct('Polygon', currPolygonsSet(i6).polygonsVertices,...
                            'Property', currPropertySet(i5));
                        pIndex = pIndex + 1;
                    end
                end

                pStr = Method2P2str(polygonsSetIndices, currPropertySet);
                t=1;
                for Q = Qs
                    k=1;
                    for z = zs
                        if (Q > z)
                            % calc score
                            disp(strcat('Q = ', num2str(Q)));
                            disp(strcat('z = ', num2str(z)));
                            disp(strcat('P = ', pStr));
                            score = ParametersScore(Q, z, P, @Method2Train, @Method2GenerateVector, 2, alignedImages)
                            scores(t, k, r1,r2) = score;
                            % check if these Q and z have better score
                            if (score > bestScore)
                                bestScore = score;
                                bestQ = Q;
                                bestz = z;
                                bestP = pStr;
                            end
                        end
                        k = k + 1;
                    end
                    t = t+1;
                end
                r2 = r2 + 1;
            end
        end
        r1 = r1 + 1;
    end
end

disp(strcat('best Q = ', num2str(bestQ)));
disp(strcat('best z = ', num2str(bestz)));
disp(strcat('best P = ', num2str(bestP)));
disp(strcat('best score = ', num2str(bestScore)));

save('Method2ParametersScores', 'scores', 'Qs', 'zs', 'polygonsIndicesPowerSet','propertiesPowerset','polygons');
