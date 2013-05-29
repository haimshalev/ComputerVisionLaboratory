function [ ] = RegisterPerson( PersonImg , PersonName )
%RegisterFace Gets a face image and insert it to the vector DB if there is
%no similar face in the DB already

disp('***RegisterPerson - Started***');
%Create the subject's vector
PersonVector = CreatePersonVector(PersonImg);

%Try to pull the person from the DB
[Found , ~ , ~] = PullVectorFromDB(PersonVector);

%If secceded Print message
if (Found == true)
    fprintf('%s already exist in the DB, registration aborted\n',PersonName);
else
    %Insert the person representation to db and saves the DB
    InsertPersonToDB(PersonVector,PersonName);
end

disp('***RegisterPerson - Ended***');

end

