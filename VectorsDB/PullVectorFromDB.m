function [Found , Multiple , PersonStructs] = PullVectorFromDB(PersonVector)
%PullVectorFromDB - Tries to pull the person from the DB.
%If only one vector from DB is in the Hamming distance specified in the
%parameters the Found variable is true and the Person variable is set with
%the chosen person from DB

disp('***PullVectorFromDB - Started***');

%Get the Vectors DB
PersonsVectorsDB = GetVectorsDB();

%Initialize the return values - return false and empty person
Found = false;
Multiple = false;
PersonStructs = [];

%Find the person in the DB
for i=1:size(PersonsVectorsDB(:))

    %if the current cell is the specified person
    if (VectorIsClose(PersonsVectorsDB(i).Vector,PersonVector))
        
        %Update the return values
        Found = true;
        PersonStructs = [PersonStructs PersonsVectorsDB(i)];
        
    end
end

%if we found the persons in db
if (Found)    
  
    %if we found multiple close vectors with different names
    if (~OnlyOnePerson(PersonStructs))
        
        disp('PullVectorFromDB Failed - Found Multiple close Vectors with different names');
        
        %Set the Multiple flag to false (There is no one choice)
        Multiple = true;
        
    end
end

disp('***PullVectorFromDB - Ended***');

end