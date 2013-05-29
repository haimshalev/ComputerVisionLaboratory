function [ Found , Multiple , Person ] = RecognizePerson( PersonImg )
%RecognizePerson - Get a person image and try to find it in the vector DB.
%If found , the funtion returns true in the first return value and also
%return the name of the person as it shown in the DB and is vector

disp('***RecognizePerson - Started***');

%Create the subject's vector
PersonVector = CreatePersonVector(PersonImg);

%Try to pull the person from the DB
[Found , Multiple, Person] = PullVectorFromDB(PersonVector);

%if Found single vector in DB print the Name
if (Found && ~Multiple)

    fprintf('This persons name is %s',Person(i).Name);
 
else
    %if Found matchin persons but multiple
    if (Found)
        
        disp ('Found Multiple matching persons in DB');
        
    %if don't found matching persons in DB
    else 
        
        disp('Do not found matching persons in DB');
    end
    
end

disp('***RecognizePerson - Ended***');

end

