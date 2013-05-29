function [ ] = InsertPersonToDB(PersonVector,PersonName)
%InsertPersonToDB - Insert the person representation to db and saves the db

disp('***InsertPersonToDB - Started***');

%Get the Vectors DB
PersonsVectorsDB = GetVectorsDB();

%Create a Person structure 
person = struct('Name',PersonName,'Vector',PersonVector);

%Insert the Vector to DB
PersonsVectorsDB = [PersonsVectorsDB person];

%Save the Vector DB
save(GetVectorsDBPath(),'PersonsVectorsDB');

disp('***InsertPersonToDB - Ended***');

end

