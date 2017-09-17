cover_image = imread('tulips.jpg');
secret_image = imread('flower.jpg');

result_image = steganograpy_encode(cover_image, secret_image, 5);
imwrite(result_image, 'result_color.png');

image = imread('result_color.png');
[original_image1, original_image2] = steganograpy_decode(image, 5);

figure(1),
% Encryption Process
subplot(2, 3, 1), imshow(cover_image), title('Cover Image'),
subplot(2, 3, 2), imshow(secret_image),title('Secret Image'),
subplot(2, 3, 3), imshow(result_image), title('Resulting Image'),
% Decryption Process
subplot(2, 3, 4), imshow(image), title('Resulting Image'),
subplot(2, 3, 5), imshow(original_image1), title('Cover Image'),
subplot(2, 3, 6), imshow(original_image2), title('Secret Image');