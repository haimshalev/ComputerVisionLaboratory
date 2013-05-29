function [bOnlyOne] = OnlyOnePerson(PersonStructs)
%OnlyOnePerson - returns true only if the vector of persons conatins only
%one key

disp('***OnlyOnePerson - Started***');

%Initialize the output flag
bOnlyOne = false;

for i =1:size(PersonStructs(:))
    
    %If we are checking the first person
    if (i ==1)
        
        %Save the name 
        Name = PersonStructs(i).Name;
        
        %Set the output var to true
        bOnlyOne = true;
        
    %If there is more then one vector
    else
        
        %If the Name of this person is different from the first name
        if (~strcmp(Name , PersonStructs(i).Name))
            
            %Set the output variable to false and exit 
            bOnlyOne = false;
            disp('***OnlyOnePerson - Ended***');
            return;
            
        end
    end
end

disp('***OnlyOnePerson - Ended***');

end