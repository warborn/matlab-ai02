clc, clear all, close all;
% 1. Read image
% image = imread('tulips.jpg');
image = imread('lenna.png');
zoomed_image = rgb2gray(image(256:360, 256:360, :));
zoomed_image_histogram = generate_histogram(zoomed_image);

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
% upper_right(:, :, 2) = 0;
% upper_right(:, :, 3) = 0;

% green image
upper_right(:, :, 1) = 0;
upper_right(:, :, 3) = 0;
% blue image
upper_left(:, :, 1) = 0;
upper_left(:, :, 2) = 0;

% gray
[bl_rows bl_cols ~] = size(bottom_left);
gray_bottom_left = rgb2gray(bottom_left);
for i = 1:3
  bottom_left(1:bl_rows, 1:bl_cols, i) = gray_bottom_left(1:bl_rows, 1:bl_cols);
end

% 6. Replace first quadrant with the histogram of the image
% set every pixel to a value of 255 to make it white
bottom_right = (bottom_right * 0) + 255;
histogram = generate_histogram(zoomed_image);
max_frequency = max(histogram);
[quadrant_height quadrant_width ~] = size(bottom_right);

prev_point = quadrant_height;
for i = 1:256
  if i < 256
    next_point = get_point(histogram(i + 1), quadrant_height, max_frequency);
  else
    next_point = quadrant_height;
  end
  
  current_point = get_point(histogram(i), quadrant_height, max_frequency);
  if histogram(i) > 0
    top = max([prev_point, next_point]);
    if top > current_point
      bottom_right(current_point:top, i, :) = 0;
    else
      bottom_right(current_point, i, :) = 0;
    end
  end

  prev_point = current_point;
end


% 7. Reorganize quadrants
top_half    = [bottom_right upper_left];
bottom_half = [upper_right bottom_left];
modified_image = [top_half; bottom_half];

% 8. Show new image
figure(1), imshow(image)
figure(2),
subplot(1, 3, 1), imshow(image),
subplot(1, 3, 2), imshow(zoomed_image),
subplot(1, 3, 3), plot(zoomed_image_histogram)

figure(3), imshow(modified_image)
