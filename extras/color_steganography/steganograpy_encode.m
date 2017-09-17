function [ stego_image ] = steganograpy_encode(cover_image, secret_image, bit_portion)
  red_channel = cover_image(:, :, 1);
  red_bits = get_bits(red_channel);

  green_channel = cover_image(:, :, 2);
  green_bits = get_bits(green_channel);

  blue_channel = cover_image(:, :, 3);
  blue_bits = get_bits(blue_channel);

  red_channel2 = secret_image(:, :, 1);
  red_bits2 = get_bits(red_channel2);

  green_channel2 = secret_image(:, :, 2);
  green_bits2 = get_bits(green_channel2);

  blue_channel2 = secret_image(:, :, 3);
  blue_bits2 = get_bits(blue_channel2);

  stego_image(:, :, 1) = merge_bits(red_bits, red_bits2, bit_portion);
  stego_image(:, :, 2) = merge_bits(green_bits, green_bits2, bit_portion);
  stego_image(:, :, 3) = merge_bits(blue_bits, blue_bits2, bit_portion);
end