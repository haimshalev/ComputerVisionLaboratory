function [ distance] = CalculateDistance( landmark, origin )

distance = sqrt((landmark(1,1) - origin(1,1))^2 + (landmark(1,2) - origin(1,2))^2);

end

