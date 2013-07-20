function [ hammingDist ] = CalcHammingDistance( representor1,representor2 )

hammingDist = sum(xor(representor1,representor2));

end

