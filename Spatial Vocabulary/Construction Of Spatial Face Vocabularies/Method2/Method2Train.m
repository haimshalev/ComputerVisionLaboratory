function [] = Method2Train( dbpath, histogramsPath, Q, P)

if (nargin < 3)
    Q = 30;
end

if (nargin < 4)
    P = PrepareFeatures();
end

% read the database (db is n x k x 2)
load(dbpath);

% histograms is a k x Q x 2
histograms = Train(globalDBout, Q, P);

% write the histograms into file in histogramsPath
save(histogramsPath, 'histograms');

end

