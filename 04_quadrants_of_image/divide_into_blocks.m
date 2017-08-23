function [ blocks ] = divide_into_blocks( image_path )
%divide_into_blocks Function that divides an image into quadrants
%   This function accepts an image path, loads the image and then
%   performs a series of operations to extract each of the quadrants
%   of the image in the following order [1, 2, 3, 4], then returns
%   a cell with four elements of which each is a quadrant
%   1 being the top left corner
%   2 being the top right corner
%   3 being the bottom left corner
%   5 being the bottom right corner

% Read an image file
image = imread(image_path);

% Get the median of rows and columns
[rows, columns, rgb] = size(image);
median_rows = round(rows / 2);
median_columns = round(columns / 2);

% Extract 4 quadrants from the original image
top_left_image     = image(1:median_rows, 1:median_columns, :);
top_right_image    = image(1:median_rows, (median_columns + 1):columns,:);
bottom_left_image  = image((median_rows + 1):rows, 1:median_columns, :);
bottom_right_image = image((median_rows + 1):rows, (median_columns + 1):columns, :);

% Store the quadrants in a cell
blocks = cell(4, 1);
blocks{1} = top_left_image;
blocks{2} = top_right_image;
blocks{3} = bottom_left_image;
blocks{4} = bottom_right_image;
end

