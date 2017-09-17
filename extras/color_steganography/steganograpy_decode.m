function [ cover_image, secret_image ] = steganograpy_decode(image, bit_portion)
  red_channel = image(:, :, 1);
  red_bits = get_bits(red_channel);

  green_channel = image(:, :, 2);
  green_bits = get_bits(green_channel);

  blue_channel = image(:, :, 3);
  blue_bits = get_bits(blue_channel);

  cover_image(:, :, 1) = reduce_bits(red_bits, [1:bit_portion]);
  cover_image(:, :, 2) = reduce_bits(green_bits, [1:bit_portion]);
  cover_image(:, :, 3) = reduce_bits(blue_bits, [1:bit_portion]);

  secret_image(:, :, 1) = reduce_bits(red_bits, [bit_portion + 1:8], 32);
  secret_image(:, :, 2) = reduce_bits(green_bits, [bit_portion + 1:8], 32);
  secret_image(:, :, 3) = reduce_bits(blue_bits, [bit_portion + 1:8], 32);
end