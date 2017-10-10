clc, clear all, close all

image = imread('figures2.png');

[rows, cols, channels] = size(image);

% Define empty matrix to hold the segmented square
output = uint8(zeros(rows, cols, channels));

% Difine counters to keep track of the number of ocurrences for each pixel
% that corresponds to the square figure, making difference between rows and columns
row_counter = zeros(1, rows);
col_counter = zeros(1, cols);

for i = 1:rows
  for j = 1:cols
    if image(i, j, 1) == 0 && image(i, j, 2) == 162 && image(i, j, 3) == 232
      output(i, j, 1) = 0;
      output(i, j, 2) = 162;
      output(i, j, 3) = 232;

      row_counter(i) = row_counter(i) + 1;
      col_counter(j) = col_counter(j) + 1;
    end
  end
end

figure, imshow(output), title('Segmented Triangle');
figure, subplot(1, 2, 1), plot(row_counter), subplot(1, 2, 2), plot(col_counter); 

% Calculate the coordinates of the three vertices of the triangle figure represented by row's histogram

% ax1 = [0, 0];
% bx1 = [0, 0];
% cx1 = [0, 0];

row_max = max(row_counter);

i = 0; row_freq = 0;
while row_freq < row_max
  i = i + 1;
  row_freq = row_counter(i);
  if row_freq == 0 && row_counter(i + 1) > 0
    % ax1 = [i, 0];
    ax = i;
  end
end

% bx1 = [i, row_max];
bx = i;

while i < rows
  row_freq = row_counter(i);
  if row_freq > 0 && row_counter(i + 1) == 0
    % cx1 = [i, 0];
    cx = i;
  end
  i = i + 1;
end

% ox1 = (ax1(1) + bx1(1) + cx1(1)) / 3;
% oy1 = (ax1(2) + bx1(2) + cx1(2)) / 3;

% Calculate the coordinates of the three vertices of the triangle figure represented by row's histogram

% ax2 = [0, 0];
% bx2 = [0, 0];
% cx2 = [0, 0];

col_max = max(col_counter);

j = 0; col_freq = 0;
while col_freq < col_max
  j = j + 1;
  col_freq = col_counter(j);
  if col_freq == 0 && col_counter(j + 1) > 0
    % ax2 = [j, 0];
    ay = j;
  end
end

% bx2 = [j, col_max];
by = j;

while j < cols
  col_freq = col_counter(j);
  if col_freq > 0 && col_counter(j + 1) == 0
    % cx2 = [j, 0];
    cy = j;
  end
  j = j + 1;
end

% ox2 = (ax2(1) + bx2(1) + cx2(1)) / 3;
% oy2 = (ax2(2) + bx2(2) + cx2(2)) / 3;

% x = round((ox1 + ox2) / 2);
% y = round((oy1 + oy2) / 2);
x = (ax + bx + cx) / 3;
y = (ay + by + cy) / 3;

output(x-1:x+1, y-1:y+1, :) = 255;

figure, imshow(output); 