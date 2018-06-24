with(argument0) {
    for(var i = 0; i < width; i++) {
        for(var j = 0; j < height; j++) {
            var tile = tile_grid[# i, j];
            ds_grid_set_flag(flag_grid, i, j, tile_flags[tile]);
        }
    }
}
