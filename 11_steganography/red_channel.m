clc, clear all, close all;

% Encryption Process

% Read images
cover_image = imread('tulips.jpg');
secret_image = imread('flower.jpg');

% Extract red channel
red_cover = cover_image(:, :, 1);
red_secret = secret_image(:, :, 1);

% Get the 8 bits of the image
cover_bits = get_bits(red_cover);
% Compensate the 6 bits
cover_comp_bits = compensate_bits(cover_bits);

secret_bits = get_bits(red_secret);
secret_comp_bits = compensate_bits(secret_bits);

% Hide secret image in cover image
result_image = cover_bits{1} + cover_bits{2} + cover_bits{3} + cover_bits{4} + cover_bits{5} + secret_bits{1}/32 + secret_bits{2}/32 + secret_bits{3}/32;

% Save resulting image on disk
imwrite(result_image, 'result_red.png');

% Decryption Process
image = imread('result_red.png');
image_bits = get_bits(image);
original_image1 = image_bits{1} + image_bits{2} + image_bits{3} + image_bits{4} + image_bits{5};
original_image2 = image_bits{6}*32 + image_bits{7}*32 + image_bits{8}*32;

% Display least significant bits from cover image
figure(1),
for i = 1:8
  subplot(2, 4, i), imshow(cover_comp_bits{i})
end

% Display least significant bits from secret image
figure(2),
for i = 1:8
  subplot(2, 4, i), imshow(secret_comp_bits{i})
end

figure(3),
% Encryption Process
subplot(2, 3, 1), imshow(cover_image), title('Cover Image'),
subplot(2, 3, 2), imshow(secret_image),title('Secret Image'),
subplot(2, 3, 3), imshow(result_image), title('Resulting Image'),
% Decryption Process
subplot(2, 3, 4), imshow(image), title('Resulting Image'),
subplot(2, 3, 5), imshow(original_image1), title('Cover Image'),
subplot(2, 3, 6), imshow(original_image2), title('Secret Image');