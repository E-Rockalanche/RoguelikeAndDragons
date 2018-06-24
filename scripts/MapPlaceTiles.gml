with(argument0) {
    for(var i = 0; i < width; i++) {
        for(var j = 0; j < height; j++) {
            var tile = tile_grid[# i, j];
            var left = (tile * TILE_SIZE) mod (TILE_SIZE * 16);
            var top = (tile * TILE_SIZE) div (TILE_SIZE * 16);
            tile_add(bkr_tiles, left, top, TILE_SIZE, TILE_SIZE, i*TILE_SIZE, j*TILE_SIZE, TILE_DEPTH);
        }
    }
}
