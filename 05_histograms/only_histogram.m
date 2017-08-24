% Generate an histogram from a gray scaled image

image = imread('tulips.jpg');

gray_image = rgb2gray(image);

gray_histogram = get_frequency(gray_image);

figure(1), bar(gray_histogram)