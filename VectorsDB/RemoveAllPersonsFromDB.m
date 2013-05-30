function [ ] = RemoveAllPersonsFromDB(  )
%RemoveAllPersonsFromDB - Clear the Vectors DB

disp('***RemoveAllPersonsFromDB - Started***');

%Create an empty db
PersonsVectorsDB = [];

%Replace the old DB with the new one
save(GetVectorsDBPath(),'PersonsVectorsDB');

disp('***RemoveAllPersonsFromDB - Ended***');


end

