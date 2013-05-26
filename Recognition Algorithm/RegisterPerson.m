function [ ] = RegisterPerson( PersonImg , PersonName )
%RegisterFace Gets a face image and insert it to the vector DB if there is
%no similar face in the DB already

%Create the subject's vector
PersonVector = CreatePersonVector(PersonImg);

%Try to pull the person from the DB
[Found , ~ , ~] = PullVectorFromDB(PersonVector);

%If secceded Print message
if (Found == true)
    disp('%s already exist in the DB, registration aborted',PersonName);
else
    %Insert the person representation to db and saves the DB
    InsertPersonToDB(PersonVector,PersonName);
end

end

