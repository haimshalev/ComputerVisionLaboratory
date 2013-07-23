function [returnString] = LoadAndRecognize(imgName)
%Load an img and try to recognize it's identity from DB
importedImg = ScaledImRead(imgName);

prefix = ['For Image Name :  ' imgName ];
returnString =RecognizePerson(importedImg);
returnString = {prefix;returnString};

end