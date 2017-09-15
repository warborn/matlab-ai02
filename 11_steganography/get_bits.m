function [ bits ] = get_bits(image)
	bits = cell(1, 8);
	bits{1} = bitand(image, 128) * 2;
	bits{2} = bitand(image, 64) * 4;
	bits{3} = bitand(image, 32) * 8;
	bits{4} = bitand(image, 16) * 16;
	bits{5} = bitand(image, 8) * 32;
	bits{6} = bitand(image, 4) * 64;
	bits{7} = bitand(image, 2) * 128;
	bits{8} = bitand(image, 1) * 256;
end