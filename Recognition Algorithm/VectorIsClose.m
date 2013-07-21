function [bClose] = VectorIsClose(VectorFromDB , PersonVector)
%VectorIsClose - returns true only if the vector of person close to the
%vector loacted in DB

disp('***VectorIsClose - Started***');

%Initialize the output flag
bClose = false;

%initialize the distance treshold
AllowedTresh = 0;

%We are not allowing more the tresh different
if (strcmp(FindSubProjectConfiguration('AppearanceVocabulary','enabled'),'true'))
    AllowedTresh = AllowedTresh + str2double(FindSubProjectConfiguration('AppearanceVocabulary','AppearanceVocabularyTreshold')); 
end

if (strcmp(FindSubProjectConfiguration('SpatialVocabulary','enabled'),'true'))
    AllowedTresh = AllowedTresh + str2double(FindSubProjectConfiguration('SpatialVocabulary','SpatialVocabularyTreshold'));
end 

%if the hamming distance lower then the treshold return true
hammingDistance = sum(abs(VectorFromDB-PersonVector));

if (hammingDistance <= AllowedTresh)
    bClose = true;
end

fprintf('***VectorIsClose - Ended with hamming distance of %d***\n',hammingDistance);

end