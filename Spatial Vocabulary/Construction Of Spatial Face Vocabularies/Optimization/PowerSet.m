function powerset = PowerSet( set )
%POWERSET Summary of this function goes here
%   Detailed explanation goes here

for nn = 1:length(set)
    % all the combinations taken nn items at a time
    powerset{nn} = combnk(set, nn);
end

end

