clear all;
clc;

method = 'Method2';
histogramsPath = strcat('../..\',method,'\Georgia Tech\histograms.mat');
load(histogramsPath);

[numberOfFeatures, Q, ~] = size(histograms);

for i=1:numberOfFeatures
    histogram = reshape(histograms(i, :, :), Q, 2);
    f = figure('Visible','off');
    plot(histogram(:,1)', histogram(:,2)');
    saveas(f, strcat('../../',method,'\Georgia Tech/images/landmark', num2str(i, '%02i'), '.jpg'));
end