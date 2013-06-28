function [ Q, z, polygonsOut, properties ] = Method2GetBestParams( scores, Qs, zs, polygonsIndicesPowerSet, propertiesPowerset,polygons )
max(scores(:))
ind = find(scores == max(scores(:)));
[a b c d] = ind2sub(size(scores), ind);% [a b c] = [Qs zs landmarks]

r1 = 1;
found = false;
for i1 = 1:length(propertiesPowerset)
    propertiesSets = propertiesPowerset{i1};
    [propertiesSetsRows, ~] = size(propertiesSets);
    for i3 = 1:propertiesSetsRows
        r2 = 1;
        for i2 = 1:length(polygonsIndicesPowerSet)
            polygonsSets = polygonsIndicesPowerSet{i2};
            [polygonsSetsRows, ~] = size(polygonsSets);
            for i4=1:polygonsSetsRows
                
                currPropertySet = propertiesSets(i3,:);

                polygonsSetIndices = polygonsSets(i4,:);
                currPolygonsSet = struct('polygonsVertices', {});
                for i5=1:length(polygonsSetIndices)
                    currPolygonsSet(i5).polygonsVertices = polygons(polygonsSetIndices(i5)).polygonsVertices;
                end

                if((c == r1) && (d == r2))
                    properties = currPropertySet;
                    polygonsOut = currPolygonsSet;
                    found = true;
                    break;
                end
                r2 = r2 + 1;
            end
            
            if(found)
                break;
            end
        end
        
        if(found)
            break;
        end
        r1 = r1 + 1
    end
    
    if(found)
        break;
    end
end

Q = Qs(a);
z = zs(b);

end

