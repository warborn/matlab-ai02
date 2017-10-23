clc, clear all, close all;
image = imread('reporter.jpg');
background = imread('background.jpg');

[rows, cols, ~] = size(image);
output = uint8(zeros(rows, cols, 3));

for i = 1:rows
	for j = 1:cols
		if image(i, j, 1) >= 50 && image(i, j, 2) >= 50 && image(i, j, 3) >= 40 && image(i, j, 1) <= 210 && image(i, j, 2) <= 240 && image(i, j, 3) <= 245
		else
			output(i, j, 1) = image(i, j, 1);
			output(i, j, 2) = image(i, j, 2);
			output(i, j, 3) = image(i, j, 3);
		end
	end
end

morph_image = imbinarize(rgb2gray(output), 1/250);
for i = 1:5
  morph_image = im_dilation(morph_image);
end

for i = 1:2
  morph_image = im_erotion(morph_image);
end

morph_image = ~morph_image;

color_output = uint8(ones(rows, cols, 3) * 255);
for i = 1:rows
  for j = 1:cols
    if morph_image(i,j) == 0
      color_output(i, j, 1) = image(i, j, 1);
      color_output(i, j, 2) = image(i, j, 2);
      color_output(i, j, 3) = image(i, j, 3);
    end
  end
end


figure, imshowpair(image, morph_image, 'montage');
figure, imshowpair(color_output, background, 'montage');

for i = 1:rows
  for j = 1:cols
    if morph_image(i,j) == 1
      color_output(i, j, 1) = background(i, j, 1);
      color_output(i, j, 2) = background(i, j, 2);
      color_output(i, j, 3) = background(i, j, 3);
    end
  end
end

figure, imshow(color_output);