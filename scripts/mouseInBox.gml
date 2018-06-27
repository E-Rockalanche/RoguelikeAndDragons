/*
arguments:
    0: mouse
    1: left
    2: top
    3: width
    4: height
*/

var mouse = argument0;
var mx = device_mouse_x(mouse);
var my = device_mouse_y(mouse);

return withinBounds(mx, my, argument1, argument2, argument1 + argument3, argument2 + argument4);
