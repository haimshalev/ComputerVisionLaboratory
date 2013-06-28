function [] = Method1Train( dbpath, histogramsPath, Q, P)

% read the database (db is n x k x 2)
load(dbpath);

% if Q and P are not set then the function uses default values.
if (nargin < 3)
    Q = 55;
end

if (nargin < 4)
%     [~,k,~] = size(globalDBout);
    P = [2, 29, 52, 61];
end

% histograms is a k x Q x 2
histograms = Method1InternalTrain(globalDBout, Q, P);

% write the histograms into file in histogramsPath
save(histogramsPath,'histograms');

end

