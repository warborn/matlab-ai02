image = imread('tulips.jpg');
red_channel = image(:, :, 1);
green_channel = image(:, :, 2);
blue_channel = image(:, :, 3);

red_histogram = get_frequency(red_channel);
green_histogram = get_frequency(green_channel);
blue_histogram = get_frequency(blue_channel);

figure(1)
subplot(3, 3, 2), imshow(image)
subplot(3, 3, 4), imshow(red_channel)
subplot(3, 3, 5), imshow(green_channel)
subplot(3, 3, 6), imshow(blue_channel)
subplot(3, 3, 7), bar(red_histogram)
subplot(3, 3, 8), bar(green_histogram)
subplot(3, 3, 9), bar(blue_histogram)