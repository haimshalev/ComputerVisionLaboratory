function [ Found , PersonName , PersonVector ] = RecognizePerson( PersonImg )
%RecognizePerson - Get a person image and try to find it in the vector DB.
%If found , the funtion returns true in the first return value and also
%return the name of the person as it shown in the DB and is vector

%Create the subject's vector
PersonVector = CreatePersonVector(PersonImg);

%Try to pull the person from the DB
[Found , PersonName , PersonVector] = PullVectorFromDB(PersonVector);

end

