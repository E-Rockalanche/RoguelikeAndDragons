/*
Notes:
    Cells with negative values are permanent and considered dead.
    Cells with values over 1 are permanent and considered alive.
    Coordinated outside the grid are considered dead.
*/
var grid = argument0;
var become_alive = argument1;
var stay_alive = argument2;
var iterations = argument3;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);
var old_grid = ds_grid_create(width, height);

for(var it = 0; it < iterations; it++) {
    //swap grid;
    var temp = old_grid;
    old_grid = grid;
    grid = temp;
    
    for(var i = 0; i < width; i++) {
        for(var j = 0; j < height; j++) {
            var cur = old_grid[# i, j];
            if (cur == 0 || cur == 1) {
                var num_alive = 0;
                for(var d = 0; d < 8; d++) {
                    var ii = i + x_dirs[d];
                    var jj = j + y_dirs[d];
                    if (withinBounds(ii, jj, 0, 0, width, height)) {
                        num_alive += (old_grid[# ii, jj] > 0);
                    }
                }
                if (cur && num_alive < stay_alive) {
                    grid[# i, j] = 0;
                } else if (!cur && num_alive >= become_alive) {
                    grid[# i, j] = 1;
                } else {
                    grid[# i, j] = old_grid[# i, j];
                }
            } else {
                grid[# i, j] = old_grid[# i, j];
            }
        }
    }
}
if (iterations mod 2 == 1) {
    //ensure grid passed as argument has latest changes
    ds_grid_copy(old_grid, grid);
    old_grid = grid;
}
ds_grid_destroy(old_grid);
