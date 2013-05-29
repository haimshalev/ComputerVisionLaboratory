function [ Found , PersonStructs ] = RemovePersonFromDB( PersonName )
%REMOVEPERSONFROMDB - Removes the person with the name provided from the
%Vector DB.
%If Person found in DB the found output parameter set to true and this
%person structs returned

disp('***RemovePersonFromDB - Started***');

%Get the Vectors DB
PersonsVectorsDB = GetVectorsDB();

%Initialize the return values - return false and empty person
Found = false;
PersonStructs = [];
RemoveIndexes = [];

%Find the person in the DB
for i=1:size(PersonsVectorsDB(:))

    %if the current cell is the specified person
    if (strcmp(PersonsVectorsDB(i).Name,PersonName))
        
        %Update the return values
        Found = true;
        PersonStructs = [PersonStructs PersonsVectorsDB(i)];
        
        %Remove the person from db
        RemoveIndexes = [RemoveIndexes i];
        
    end
end

%if we found the persons in db
if (Found)
    
    %Remove the persons 
    PersonsVectorsDB(RemoveIndexes) = [];

    %Save the Vector DB
    save(GetVectorsDBPath(),'PersonsVectorsDB');
end

disp('***RemovePersonFromDB - Ended***');

end

