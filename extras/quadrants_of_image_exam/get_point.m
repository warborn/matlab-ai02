function [ starting_point ] = get_point(bar_height, max_height, max_freq)
  scaled_bar_height = ceil((bar_height * max_height) / max_freq);
  starting_point = max_height - scaled_bar_height + 1;
  if starting_point > max_height
    starting_point = max_height;
  end
end