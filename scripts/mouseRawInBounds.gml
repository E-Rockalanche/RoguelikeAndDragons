/*
arguments:
    0: mouse
    1: left
    2: top
    3: right
    4: bottom
*/

var mouse = argument0;
var mx = device_mouse_raw_x(mouse);
var my = device_mouse_raw_y(mouse);

return withinBounds(mx, my, argument1, argument2, argument3, argument4);
