image = imread('tulips.jpg');

gray_image = rgb2gray(image);
gray_histogram = get_frequency(gray_image);

doubled_image = double(gray_image);
sum_image = uint8(doubled_image + 20);
subtract_image = uint8(doubled_image - 30);
multiplication_image = uint8(doubled_image / 0.8);
division_image = uint8(doubled_image * 0.5);

figure(1)
subplot(3, 4, 2), imshow(gray_image), title('Gray Image')
subplot(3, 4, 3), bar(gray_histogram), title('Histogram of Gray Image')

subplot(3, 4, 5), imshow(sum_image), title('Addition')
subplot(3, 4, 6), imshow(subtract_image), title('Subtraction')
subplot(3, 4, 8), imshow(multiplication_image), title('Multiplication')
subplot(3, 4, 7), imshow(division_image), title('Division')

subplot(3, 4, 9), bar(get_frequency(sum_image)), title('Addition Histogram')
subplot(3, 4, 10), bar(get_frequency(subtract_image)), title('Subtraction Histogram')
subplot(3, 4, 12), bar(get_frequency(multiplication_image)), title('Multiplication Histogram')
subplot(3, 4, 11), bar(get_frequency(division_image)), title('Division Histogram')

