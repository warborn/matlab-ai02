image = rgb2gray(imread('docker.png'));
image2 = rgb2gray(imread('phoenix.png'));

histogram = get_histogram(image);
thresholded_image = threshold_image(image, 160);

histogram2 = get_histogram(image2);
thresholded_image2 = threshold_image(image2, 130);

figure(1),
subplot(2, 3, 1), imshow(image),
subplot(2, 3, 2), plot(histogram),
subplot(2, 3, 3), imshow(thresholded_image),
subplot(2, 3, 4), imshow(image2),
subplot(2, 3, 5), plot(histogram2),
subplot(2, 3, 6), imshow(thresholded_image2),

figure(2), 
subplot(1, 4, 1), imshow(thresholded_image & thresholded_image2), title('AND Operation')
subplot(1, 4, 2), imshow(thresholded_image | thresholded_image2), title('OR Operation')
subplot(1, 4, 3), imshow(~thresholded_image), title('NOT Operation')
subplot(1, 4, 4), imshow(~thresholded_image2), title('NOT Operation')