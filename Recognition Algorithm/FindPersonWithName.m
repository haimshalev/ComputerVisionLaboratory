function [SamePerson] = FindPersonWithName(Persons,subjectName)
%Is The same Person checks if one of the persons in the persons container
%has the subject names

%Initialize the output variable
SamePerson = false;

%Iterate over all the Persons
for i=1:size(Persons,2)

    %Check if the current person has the same name has the subjectName
    if (strcmp(Persons(i).Name,subjectName))
    
        %Set the outputParameter to true
        SamePerson = true;
        return;
    end
    
end

end