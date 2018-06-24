/*
Notes:
    Cells with negative values are permanent and considered dead.
    Cells with values over 1 are permanent and considered alive.
    Coordinated outside the grid are considered dead.
*/

var grid = argument0;
var seed_chance = argument1;
var become_alive = argument2;
var stay_alive = argument3;
var iterations = argument4;

ds_grid_seed_blobs(grid, seed_chance);
ds_grid_smooth_blobs(grid, become_alive, stay_alive, iterations);


