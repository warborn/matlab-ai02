% Read an image from disk
image = imread('docker.png');

red_channel = image;
red_channel(:, :, 2) = 0;
red_channel(:, :, 3) = 0;

green_channel = image;
green_channel(:, :, 1) = 0;
green_channel(:, :, 3) = 0;


blue_channel = image;
blue_channel(:, :, 1) = 0;
blue_channel(:, :, 2) = 0;

figure(1)
subplot(2,3,2), imshow(image)
subplot(2,3,4), imshow(red_channel)
subplot(2,3,5), imshow(green_channel)
subplot(2,3,6), imshow(blue_channel)