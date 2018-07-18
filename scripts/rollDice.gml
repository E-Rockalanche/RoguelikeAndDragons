/*
arguments:
    0: number of dice
    1: number of sides
    
    return value: int
*/
var total = 0;
repeat(argument0) {
    total += irandom(argument1 - 1) + 1;
}
return total;
