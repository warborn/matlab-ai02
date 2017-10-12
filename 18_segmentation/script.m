image = imread('image.jpg');

[rows, cols, channels] = size(image);
output = uint8(zeros(rows, cols, channels));

row_counter = zeros(1, rows);
col_counter = zeros(1, cols);
for i = 1:rows
	for j = 1:cols
		if image(i, j, 1) > 50 && image(i, j, 2) >= 0 && image(i, j, 3) >= 0 && image(i, j, 1) <= 255 && image(i, j, 2) < 100 && image(i, j, 3) < 100
			output(i, j, 1) = 255;
			output(i, j, 2) = 0;
			output(i, j, 3) = 0;

			row_counter(i) = row_counter(i) + 1;
      		col_counter(j) = col_counter(j) + 1;
		end
	end
end

edge_image = edge(rgb2gray(output));

max_row = max(row_counter) - 10;
max_col = max(col_counter) - 10;

imin = 0; rmin = 0;
while rmin < max_row
  imin = imin + 1;
  rmin = row_counter(imin);
end

i = imin;
while i < rows
  if row_counter(i) >= max_row
    imax = i;
  end
  i = i + 1;
end

jmin = 0; cmin = 0;
while cmin < max_col
  jmin = jmin + 1;
  cmin = col_counter(jmin);
end

j = jmin;
while j < cols
  if col_counter(j) >= max_col
    jmax = j;
  end
  j = j + 1;
end

x = round((imin + imax) / 2);
y = round((jmin + jmax) / 2);

figure, imshowpair(image, output, 'montage');

figure, imshowpair(output, edge_image);

edge_image(x-1:x+1, y-1:y+1, :) = 255;

figure, imshow(edge_image);
