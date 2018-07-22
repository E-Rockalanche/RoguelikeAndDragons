/*
arguments:
    0: x0
    1: y0
    2: x1
    3: y1
    
    return value: int
*/
var xx = abs(argument0 - argument2);
var yy = abs(argument1 - argument3);
return min(xx, yy)*1.5 + abs(xx - yy);
