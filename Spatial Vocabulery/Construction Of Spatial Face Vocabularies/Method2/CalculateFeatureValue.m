function featureValue = CalculateFeatureValue( landmarks, feature )

[ratio,minSide,maxSide] = CalculateSidesRatio(landmarks, feature.Polygon);
[polygonXs, polygonYs] = XYVectorsFromPolygon(landmarks, feature.Polygon);
[ geom, iner, cpmo ] = polygeom( polygonXs, polygonYs );
switch (feature.Property)
    case 1 % area
        %featureValues(i) = CalculateArea(reshapedDB, feature.Polygon);
        featureValue = geom(1);
    case 2 % diameter
        %featureValues(i) = CalculateDiameter(reshapedDB, feature.Polygon);
        featureValue = geom(4);
    %cpmo = [ I1  ang1  I2  ang2  J ];
    case 3 % centroidal principal moments 1st eigenvalue
        featureValue = cpmo(1);
    case 4 % centroidal principal moments 1st eigenvector angle
        featureValue = cpmo(2);
    case 5 % centroidal principal moments 2st eigenvalue
        featureValue = cpmo(3);
    case 6 % J
        featureValue = cpmo(5);
    case 7
        featureValue = geom(2);
    case 8
        featureValue = geom(3);
    case 9
        featureValue = ratio;
    case 10
        featureValue = minSide;
    case 11
        featureValue = maxSide;
    % bad features:
    % centroidal principal moments 2st eigenvector angle - cpmo(4)
    otherwise
        disp('Error: unknown Property number.');
end

end

