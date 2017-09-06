% 1. Read image
% image = imread('tulips.jpg');
image = imread('lenna.png');
% 2. Get size of image
[rows cols ~] = size(image);
% 3. Calculate mid height and width
mid_height = round(rows / 2);
mid_width  = round(cols / 2);
% 4. Extract quadrants
upper_left   = image(1:mid_height, 1:mid_width, :);
upper_right  = image(1:mid_height, (mid_width + 1):cols, :);
bottom_left  = image((mid_height + 1):rows, 1:mid_width, :);
bottom_right = image((mid_height + 1):rows, (mid_width + 1):cols, :);
% 5. Modify 3 quadrants to be red, green and blue respectively
% red image
upper_right(:, :, 2) = 0;
upper_right(:, :, 3) = 0;

% green image
bottom_left(:, :, 1) = 0;
bottom_left(:, :, 3) = 0;
% blue image
bottom_right(:, :, 1) = 0;
bottom_right(:, :, 2) = 0;

% 6. Replace first quadrant with the histogram of the image
% set every pixel to a value of 255 to make it white
upper_left = (upper_left * 0) + 255;
% histogram = generate_histogram(rgb2gray(image));
max_frequency = max(histogram);
[quadrant_height quadrant_width ~] = size(upper_left)
% 384 => 9000
%     <= 10 

bar_width = floor(quadrant_width / 256);
for i = 1:256
  % adjust height of the bar according the image dimesion
  bar_height = ceil((histogram(i) * quadrant_height) / max_frequency);
  range = (quadrant_height - bar_height) + 1:quadrant_height;
  % start_col = 2 * (i - 1) + 1;
  % upper_left(range, start_col:start_col + bar_width - 1, :) = 0;
  upper_left(range, i, :) = 0;
end


% 7. Reorganize quadrants
top_half    = [upper_left upper_right];
bottom_half = [bottom_left bottom_right];
modified_image = [top_half; bottom_half];

% 8. Show new image
figure(1), imshow(modified_image)
figure(2), bar(get_histogram(rgb2gray(image)));
