function [imagesSoFar, globalDBout ] = FolderImagesToLandmarks( folderName, model, imagesSoFar, globalDBin, posemap, outputFolder )

globalDBout = globalDBin;
mkdir(outputFolder);
ims = dir(strcat(folderName, '/*.jpg'));
for i = 1:length(ims),
    imagesSoFar = imagesSoFar+1;
    fprintf('executing: %d\n', imagesSoFar);
    im = imread([folderName '/' ims(i).name]);
    %clf; imagesc(im); axis image; axis off; drawnow;
    
    tic;
    bs = detect(im, model, model.thresh);
    bs = clipboxes(im, bs);
    bs = nms_face(bs,0.3);
    dettime = toc;
    
    % show highest scoring one
    f = figure('Visible', 'off');
    showboxes(im, bs(1),posemap),title('Highest scoring detection');
    figurePath = strcat(outputFolder, '/', ims(i).name);
    saveas(f, figurePath);
    % show all
    % figure,showboxes(im, bs,posemap),title('All detections above the threshold');
    
    count = 1;
    for b = bs,
        tt = size(b.xy);
        currOutput = zeros(tt(1), 2); % #landmarks X {x, y}
    
        for j = size(b.xy,1):-1:1;
            x1 = b.xy(j,1);
            y1 = b.xy(j,2);
            x2 = b.xy(j,3);
            y2 = b.xy(j,4);
        
            currOutput(j,1) = (x1+x2)/2;
            currOutput(j,2) = (y1+y2)/2;
        end
        filePath = strcat(outputFolder, '/', ims(i).name, '.', num2str(count), '.mat');
        %disp(strcat('now writing the file: ', filePath));
        save(filePath, 'currOutput');
        
        currOutputSize = size(currOutput);
        if isempty(globalDBout)
            globalDBout = zeros(1, currOutputSize(1), currOutputSize(2));
            globalDBSize = 0;
        else
            [globalDBSize,~,~] = size(globalDBout);
        end
        globalDBout(globalDBSize+1, :, :) = currOutput;
        count = count + 1;
    end
    fprintf('Detection took %.1f seconds\n',dettime);
    %close all;
end

allSubfiles = dir(folderName);

for i = 1:length(allSubfiles)
    if allSubfiles(i).isdir && ~strcmp(allSubfiles(i).name, '.') && ~strcmp(allSubfiles(i).name, '..')
        [imagesSoFar, globalDBout] =...
            FolderImagesToLandmarks(strcat(folderName, '/', allSubfiles(i).name),...
            model, imagesSoFar, globalDBout, posemap, ...
            strcat(outputFolder, '/', allSubfiles(i).name));
    end
end

end

