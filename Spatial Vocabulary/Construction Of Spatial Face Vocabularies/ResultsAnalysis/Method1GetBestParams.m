function [Q, z, P] = Method1GetBestParams( scores, Qs, zs, landmarksPowerset )

ind = find(scores == max(scores(:)));
[a b c] = ind2sub(size(scores), ind);% [a b c] = [Qs zs landmarks]

found = false;
k = 0;
for i=1:length(landmarksPowerset)
    [rows, ~] = size(landmarksPowerset{i});
    
    for j=1:rows
        k = k + 1;
        if (k == c)
            P = landmarksPowerset{i}(j, :);
            found = true;
            break;
        end
    end
    
    if (found)
        break;
    end
end

Q = Qs(a);
z = zs(b);

end

