function [ Message ] = RegisterPerson( PersonImg , PersonName )
%RegisterFace Gets a face image and insert it to the vector DB if there is
%no similar face in the DB already

disp('***RegisterPerson - Started***');
%Create the subject's vector
PersonVector = CreatePersonVector(PersonImg);

%Try to pull the person from the DB
[Found , ~ , Person] = PullVectorFromDB(PersonVector);

%Check is the person is in the DB already    
if (Found == true && FindPersonWithName(Person,PersonName))
    Message = [PersonName ' already exist in the DB, registration aborted'];
else
    %Insert the person representation to db and saves the DB
    InsertPersonToDB(PersonVector,PersonName);
    Message = 'Person added to DB';
end

fprintf('\n %s \n\n',Message);

disp('***RegisterPerson - Ended***');

end
