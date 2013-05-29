function [ VectorsDB ] = GetVectorsDB( )
%GetVectorsDB - Returns the vectors DB instance

%Get the Vectors DB Path 
VectorDBPath = GetVectorsDBPath();

%Load the Vectors DB
VectorsDB = load(VectorDBPath);
VectorsDB = VectorsDB.PersonsVectorsDB;

end 

