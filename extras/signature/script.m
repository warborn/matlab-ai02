clc, clear all, close all;

image = rgb2gray(imread('image2.jpg'));
edge_image = edge(image);

[rows, cols] = size(image);
pixel = 0;

for i = 1:rows
  for j = 1:cols
    if edge_image(i, j) == 1
      pixel = pixel + 1;
      row_counter(pixel) = i;
      col_counter(pixel) = j;
    end
  end
end

sum_rows = sum(row_counter);
sum_cols = sum(col_counter);
x = round(sum_rows / pixel);
y = round(sum_cols / pixel);

edge_image(x-1:x+1, y-1:y+1) = 1;

for i = 1:pixel
  signature(i) = sqrt((x - row_counter(i))^2 + (y - col_counter(i))^2);
end

figure, imshow(edge_image);
figure, plot(signature);