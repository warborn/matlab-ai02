function [ added_bits ] = reduce_bits(bit_group, range, multiplier)
  added_bits = 0;
  
  if nargin < 3
    multiplier = 1;
  end

  for i = range
    added_bits = added_bits + (bit_group{i} * multiplier);
  end
end