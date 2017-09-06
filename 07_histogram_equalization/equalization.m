image = rgb2gray(imread('tulips.jpg'));

% Variable declarations
[rows cols] = size(image);
total_pixels = rows * cols;
pmf = zeros(1, 256);
cdf = zeros(1, 256);
equalized_image = zeros(rows, cols);

% 1. Generate histogram for image
histogram = get_histogram(image);

% 2. Calculate the PMF
for i = 1:256
  pmf(i) = histogram(i) / total_pixels;
end

% 3. Calculate the CDF
cdf(1) = pmf(1);
for i = 2:256
  cdf(i) = cdf(i - 1) + pmf(i);
end

% 4. Equalize
equalizer = cdf * 255;

for i = 1:rows
  for j = 1:cols
    index = image(i, j) + 1;
    equalized_image(i, j) = equalizer(index);
  end
end

% 5. Generate histogram for equalized image
equalized_image = uint8(equalized_image);
equalized_histogram = get_histogram(equalized_image);

figure(1)
subplot(2, 3, 1), imshow(image), title('Original Image')
subplot(2, 3, 2), bar(histogram), title('Original Image Histogram')
subplot(2, 3, 4), imshow(equalized_image), title('Equalized Image')
subplot(2, 3, 5), plot(cdf), title('CDF')
subplot(2, 3, 6), bar(equalized_histogram), title('Equalized Image Histogram')