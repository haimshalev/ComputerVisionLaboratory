function [ returnString ] = LoadAndReg(imgName)
%Load an img and register it to the vector DB

importedImg = ScaledImRead(imgName);

prefix = ['For Image Name :  ' imgName ];
returnString =RegisterPerson(importedImg,imgName);
returnString = {prefix;returnString};

end