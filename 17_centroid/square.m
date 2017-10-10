clc, clear all, close all

image = imread('figures.png');

[rows, cols, channels] = size(image);

% Define empty matrix to hold the segmented square
output = uint8(zeros(rows, cols, channels));

% Difine counters to keep track of the number of ocurrences for each pixel
% that corresponds to the square figure, making difference between rows and columns
row_counter = zeros(1, rows);
col_counter = zeros(1, cols);

for i = 1:rows
  for j = 1:cols
    if image(i, j, 1) == 181 && image(i, j, 2) == 230 && image(i, j, 3) == 29
      output(i, j, 1) = 181;
      output(i, j, 2) = 230;
      output(i, j, 3) = 29;

      row_counter(i) = row_counter(i) + 1;
      col_counter(j) = col_counter(j) + 1;
    end
  end
end

figure, imshow(output), title('Segmented Square');
figure, subplot(1, 2, 1), plot(row_counter), subplot(1, 2, 2), plot(row_counter); 

% "Cut" the tip of the histograms to make easier to find two points in the graph
% This method defines a maximum limit value for each histogram, 
% this value will be used as, the new tip
max_row = max(row_counter) - 10;
max_col = max(col_counter) - 10;

% Calculate the "i" minimum value that represents the left point of the tip of the row's histogram
imin = 0; rmin = 0;
while rmin < max_row
  imin = imin + 1;
  rmin = row_counter(imin);
end

% Calculate the "i" maximum value that represents the right point of the tip of the row's histogram
i = imin;
while i < rows
  if row_counter(i) >= max_row
    imax = i;
  end
  i = i + 1;
end

% Calculate the "j" minimum value that represents the left point of the tip of the columns's histogram
jmin = 0; cmin = 0;
while cmin < max_col
  jmin = jmin + 1;
  cmin = col_counter(jmin);
end

% Calculate the "j" maximum value that represents the right point of the tip of the columns's histogram
j = jmin;
while j < cols
  if col_counter(j) >= max_col
    jmax = j;
  end
  j = j + 1;
end

x = round((imin + imax) / 2);
y = round((jmin + jmax) / 2);

output(x-1:x+1, y-1:y+1, :) = 0;
figure, imshow(output);