function [ compensated_bits ] = compensate_bits(bit_cell)
	compensated_bits = cell(1, 8);
	mult = 2;
	for i = 1:8
		compensated_bits{i} = bit_cell{i} * mult;
		mult = mult * 2;
	end
end