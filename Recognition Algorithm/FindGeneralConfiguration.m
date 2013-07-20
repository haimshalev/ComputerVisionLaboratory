function [ s ] = FindGeneralConfiguration( conf )
%FindGeneralConfiguration - Get a node name and
%returns is data from the generalConfiguration node in the configuration file

s = FindSubProjectConfiguration('GeneralConfiguration',conf);

end

