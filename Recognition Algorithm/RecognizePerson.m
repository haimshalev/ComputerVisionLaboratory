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
    
    fprintf('\n ! This persons name is %s\n\n',Person(1).Name);
 
else
    %if Found matchin persons but multiple
    if (Found)
        
        fprintf('\n ! Found Multiple matching persons in DB\n\n');
        
    %if don't found matching persons in DB
    else 
        
        fprintf('\n ! Do not found matching persons in DB\n\n');;
    end
    
end

disp('***RecognizePerson - Ended***');

end

