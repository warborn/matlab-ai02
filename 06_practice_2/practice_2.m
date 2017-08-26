% Subject: Inteligencia Artificial I
% Student: Munguía Cruz Iván Alejandro

% Practice 2. Image manipulation with arithmetic operations
clc, clear all, close all

dark_image = imread('dark.jpg');
bright_image = imread('bright.jpg');
high_contrast_image = imread('high_contrast.jpg');
low_contrast_image = imread('low_contrast.jpg');

adjusted_dark_image = uint8(double(dark_image) + 60);
adjusted_bright_image = uint8(double(bright_image) - 100);

% Used formula to adjust (decrease) contrast:
% F = (259 ( C + 255)) / (255 * (259 - C))
% F = Contrast Factor
% C = Contrast Level
contrast_level = -100;
contrast_factor = (259 * (contrast_level + 255)) / (255 * (259 - contrast_level));
adjusted_high_contrast_image = uint8(contrast_factor * (double(high_contrast_image) - 128) + 128);

% Used formula to increase contrast:
% g = ((f - fmin) / (fmax - fmin)) * 255
% fmin = minimum pixel intensity
% fmax = maximum pixel intensity
% f = image to adjust
% g( = adjusted image
adjusted_low_contrast_image = uint8(((double(low_contrast_image) - 60) / (255 - 60)) * 255);

figure(1)
subplot(4, 4, 1), imshow(dark_image), title('Oscura')
subplot(4, 4, 2), imshow(bright_image), title('Clara')
subplot(4, 4, 3), imshow(high_contrast_image), title('Alto Contraste')
subplot(4, 4, 4), imshow(low_contrast_image), title('Bajo Contraste')

subplot(4, 4, 5), bar(get_histogram(rgb2gray(dark_image))), title('Histograma')
subplot(4, 4, 6), bar(get_histogram(rgb2gray(bright_image))), title('Histograma')
subplot(4, 4, 7), bar(get_histogram(rgb2gray(high_contrast_image))), title('Histograma')
subplot(4, 4, 8), bar(get_histogram(rgb2gray(low_contrast_image))), title('Histograma')

subplot(4, 4, 9), imshow(adjusted_dark_image), title('Oscura Ajustada')
subplot(4, 4, 10), imshow(adjusted_bright_image), title('Clara Ajustada')
subplot(4, 4, 11), imshow(adjusted_high_contrast_image), title('Alto Contraste Ajustada')
subplot(4, 4, 12), imshow(adjusted_low_contrast_image), title('Bajo Contraste Ajustada')

subplot(4, 4, 13), bar(get_histogram(rgb2gray(adjusted_dark_image))), title('Histograma')
subplot(4, 4, 14), bar(get_histogram(rgb2gray(adjusted_bright_image))), title('Histograma')
subplot(4, 4, 15), bar(get_histogram(rgb2gray(adjusted_high_contrast_image))), title('Histograma')
subplot(4, 4, 16), bar(get_histogram(rgb2gray(adjusted_low_contrast_image))), title('Histograma')