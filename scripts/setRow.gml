/*
Sets the row of the given 2D array to arguments 2-n
*/

var array = argument[0];
var row = argument[1];

for(var n = 0; n < argument_count-2; n++) {
    array[@ row, n] = argument[n + 2];
}
