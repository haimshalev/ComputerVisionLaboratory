function [] = Method1Train( dbpath, histogramsPath)

% read the database (db is n x k x 2)
load(dbpath);

% histograms is a k x Q x 2
histograms = Train(globalDBout);

% write the histograms into file in histogramsPath
save(histogramsPath,'histograms');

end

