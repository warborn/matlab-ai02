clc, clear all, close all

image = imread('figures.png');

[rows, cols, channels] = size(image);

output = zeros(rows, cols, channels);

for i = 1:rows
	for j = 1:cols
		if image(i, j, 1) > 200 && image(i, j, 2) < 100 && image(i, j, 3) < 50
			output(i, j, 1) = 255;
			output(i, j, 2) = 0;
			output(i, j, 3) = 0;
		end
	end
end

row_counter = zeros(1, rows);
col_counter = zeros(1, cols);
for i = 1:rows
	for j = 1:cols
		if output(i, j, 1) == 255
			row_counter(i) = row_counter(i) + 1;
			col_counter(j) = col_counter(j) + 1;
		end
	end
end

row_max = max(row_counter) - 10;
col_max = max(col_counter) - 10;

figure, plot(row_counter);
figure, plot(col_counter);

imin = 0; rmin = 0;
while rmin < row_max
	imin = imin + 1;
	rmin = row_counter(imin);
end

jmin = 0; cmin = 0;
while cmin < col_max
	jmin = jmin + 1;
	cmin = col_counter(jmin);
end

i = imin; j = jmin;
while i <= rows
	if row_counter(i) >= row_max
		imax = i;
	end
	i = i + 1;
end

while j <= cols
	if col_counter(j) >= col_max
		jmax = j;
	end
	j = j + 1;
end

x = round((imin + imax) / 2);
y = round((jmin + jmax) / 2);

output(x-1:x+1, y-1:y+1) = 0;

figure, imshow(output);