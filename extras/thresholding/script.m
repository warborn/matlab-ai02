% Thresholding implementation
image = rgb2gray(imread('tulips.jpg'));

% Convert image to double
doubled_image = double(image);

% Get otsu level of threshold
otsu_level = graythresh(image);

% Threshold image using imbinarize built-in function
otsu_threshold = imbinarize(image, otsu_level);
threshold_50 = imbinarize(image, 50 / 255);
threshold_100 = imbinarize(image, 100 / 255);
threshold_150 = imbinarize(image, 150 / 255);
threshold_200 = imbinarize(image, 200 / 255);

% Show images
figure(1)
subplot(2, 3, 1), imshow(image), title('Original Image')
subplot(2, 3, 2), imshow(otsu_threshold), title('Using Otsu Threshold value')
subplot(2, 3, 3), imshow(threshold_50), title('Using Threshold value of 50')
subplot(2, 3, 4), imshow(threshold_100), title('Using Threshold value of 100')
subplot(2, 3, 5), imshow(threshold_150), title('Using Threshold value of 150')
subplot(2, 3, 6), imshow(threshold_200), title('Using Threshold value of 200')

% Threshold image using custom function
figure(2)
subplot(2, 3, 1), imshow(image), title('Original Image')
subplot(2, 3, 2), imshow(threshold_image(image, otsu_level)), title('Using Otsu Threshold value')
subplot(2, 3, 3), imshow(threshold_image(image, 50)), title('Using Threshold value of 50')
subplot(2, 3, 4), imshow(threshold_image(image, 100)), title('Using Threshold value of 100')
subplot(2, 3, 5), imshow(threshold_image(image, 150)), title('Using Threshold value of 150')
subplot(2, 3, 6), imshow(threshold_image(image, 200)), title('Using Threshold value of 200')