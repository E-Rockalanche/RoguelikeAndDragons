var grid = argument0;
var clone = ds_grid_create(ds_grid_width(grid), ds_grid_height(grid));
ds_grid_copy(clone, grid);
return clone;
