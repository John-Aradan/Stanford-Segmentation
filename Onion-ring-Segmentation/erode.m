function [mask, mask_diff] = erode(mask,n)

% Threshold image with global threshold
BW = imbinarize(mask);

% Fill holes
BW = imfill(BW, 'holes');

% Erode mask with default
radius = n;
decomposition = 0;
se = strel('disk', radius, decomposition);
se2 = strel('disk', 10, decomposition);
BW = imdilate(BW, se2);
BW = imerode(BW, se);

% Calculate the mask_diff
mask_diff = imbinarize(mask) - BW;

mask = BW;

end