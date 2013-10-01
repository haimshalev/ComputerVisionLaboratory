function [  ] = DisplaySummary( Summary )
%DISPLAYSUMMARY  - print the summary of the method

disp('Summary:');

for i=1:size(Summary,2)
    disp(Summary{1,i});
    disp(Summary{2,i});
end

end

