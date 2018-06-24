/*
Note:
    A return value of -1 means a blob failed to generate.
    Either increase the grid size or the seed chance for a higher probability of success.
*/

var width = argument0;
var height = argument1;
var seed_chance = argument2;

if (width < 4) || (height < 4)
    return NULL;

var grid = ds_grid_create(width, height);
ds_grid_generate_blobs(grid, seed_chance, 5, 4, 6);

var max_size = 0;
var max_blob_id = 0;
var num_blobs = 0;

for(var i = 0; i < width; i++) {
    for(var j = 0; j < height; j++) {
        if (grid[# i, j] == 1) {
            var blob_id = num_blobs + 2;
            num_blobs++;
            var size = ds_grid_flood_fill(grid, i, j, blob_id);
            if (size > max_size) {
                max_size = size;
                max_blob_id = blob_id;
            }
        }
    }
}

if (!max_blob_id) {
    ds_grid_destroy(grid);
    return NULL;
}

var left = width;
var top = height;
var right = -1;
var bottom = -1;

for(var i = 0; i < width; i++) {
    for(var j = 0; j < height; j++) {
        if (grid[# i, j] == max_blob_id) {
            grid[# i, j] = 1;
            if (i < left) left = i;
            if (j < top) top = j;
            if (i >  right) right = i;
            if (j > bottom) bottom = j;
        } else {
            grid[# i, j] = 0;
        }
    }
}

var blob = ds_grid_create(right - left + 1, bottom - top + 1);
ds_grid_set_grid_region(blob, grid, left, top, right, bottom, 0, 0);
ds_grid_destroy(grid);

return blob;
