function [ ] = InsertPersonToDB(PersonVector,PersonName)
%InsertPersonToDB - Insert the person representation to db and saves the db

%Get the Vectors DB
VectorDB = GetVectorsDB();

%Create a Person structure 
person = struct('Name',PersonName,'Vector',PersonVector);

%Insert the Vector to DB
VectorDB = [VectorDB person];

%Save the Vector DB
save(GetVectorsDBPath(),VectorDB);

end

