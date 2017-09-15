clc, clear all, close all;

image = imread('tulips.jpg');
image2 = imread('phoenix1.png');

red = image(:, :, 1);
red2 = image2(:, :, 1);

green = image(:, :, 2);
blue = image(:, :, 3);

red_bits = get_bits(red);
red_bits_comp = compensate_bits(red_bits);

red_bits2 = get_bits(red2);
red_bits_comp2 = compensate_bits(red_bits2);

graph = red_bits_comp{1} + red_bits_comp{2} + red_bits_comp{3} + red_bits_comp{4} + red_bits_comp{5} + red_bits_comp2{1}/32 + red_bits_comp2{2}/32 + red_bits_comp2{3}/32;


figure(1),
for i = 1:8
	subplot(2, 4, i), imshow(red_bits_comp{i})
end

figure(2), imshow(graph);