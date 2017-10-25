function [output] = paintbutton(handles, direction, color)
  switch direction
    case 'up'
      button = handles.upButton;
    case 'down'
      button = handles.downButton;
    case 'right'
      button = handles.rightButton;
    case 'left'
      button = handles.leftButton;
    otherwise
  end

  set(button, 'BackgroundColor', color);
end