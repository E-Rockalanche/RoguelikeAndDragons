var grass_grid = ds_grid_create(width, height);
ds_grid_seed_blobs(grass_grid, 40);
ds_grid_smooth_blobs(grass_grid, 5, 4, 8);
for(var i = 1; i < width-1; i++) {
    for(var j = 1; j < height-1; j++) {
        if ((tile_grid[# i, j] == Tile.FLOOR) && (grass_grid[# i, j])) {
            tile_grid[# i, j] = Tile.GRASS_TALL;
        }
    }
}
ds_grid_destroy(grass_grid);
