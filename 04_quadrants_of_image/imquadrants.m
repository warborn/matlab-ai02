function [ changed_image ] = imquadrants( image_path, quadrant_order )
%imquadrants Function that changes and image based on the given quadrant sorder
%   This function makes use of the divide_into_blocks function
%   to divide an image into quadrants an then based on the quadrant_order
%   array, builds a new image
blocks = divide_into_blocks(image_path);

% Compose the image with the following quadrant order: 4, 3, 2, 1 
top_half_image = [blocks{quadrant_order(1)} blocks{quadrant_order(2)}];
bottom_half_image = [blocks{quadrant_order(3)} blocks{quadrant_order(4)}];
changed_image = [top_half_image; bottom_half_image];
end

