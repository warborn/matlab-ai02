blocks = divide_into_blocks('docker.png');

% Compose the image with the following quadrant order: 4, 3, 2, 1 
top_half_image = [blocks{4} blocks{3}];
bottom_half_image = [blocks{2} blocks{1}];
changed_image = [top_half_image; bottom_half_image];

% Display the changed image
imshow(changed_image)