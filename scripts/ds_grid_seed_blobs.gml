/*
Notes:
    Cells with negative values are permanent and considered dead.
    Cells with values over 1 are permanent and considered alive.
    Coordinated outside the grid are considered dead.
*/
var grid = argument0;
var seed_chance = argument1;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

for(var i = 0; i < width; i++) {
    for(var j = 0; j < height; j++) {
        var cur = grid[# i, j];
        if (cur == 0 || cur == 1) {
            grid[# i, j] = chance(seed_chance);
        }
    }
}
