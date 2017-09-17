function [ added_bits ] = merge_bits(bit_group1, bit_group2, bit_portion)
  added_bits = 0;

  for i = 1:8
    if i <= bit_portion
      added_bits = added_bits + bit_group1{i};
    else
      added_bits = added_bits + (bit_group2{i - bit_portion} / 32);
    end
  end
end