function [output] = mousemove(mouse, currentPoint, direction, steps)
  % strcat('x: ', string(currentPoint.x), ' y:', string(currentPoint.y))

  % Fixes the problem of moving the cursor to the right direction no matter what
  currentPoint.x = currentPoint.x - 1;
  
  % Change the current cursor coordinates based on the pressed arrow
  switch direction
    case 'up'
      currentPoint.y = currentPoint.y - steps;
    case 'down'
      currentPoint.y = currentPoint.y + steps;
    case 'right'
      currentPoint.x = currentPoint.x + steps;
    case 'left'
      currentPoint.x = currentPoint.x - steps;
    otherwise
  end

  % Move the cursor to the specified X and Y coordinates
  mouse.mouseMove(currentPoint.x, currentPoint.y);
end