function mask_diff = border(mask,radius)

% Threshold image with global threshold
BW = imbinarize(mask);

% Fill holes
BW = imfill(BW, 'holes');

% Erode mask with default
decomposition = 0;
se = strel('disk', radius, decomposition);

BW_dil = imdilate(BW, se);
BW_ero = imerode(BW, se);


% Calculate the mask_diff
mask_diff = BW_dil-BW_ero;


end