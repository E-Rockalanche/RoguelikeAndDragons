with(argument0) {
    for(var i = 0; i < width; i++) {
        for(var j = 0; j < height; j++) {
            if (movement_grid[# i, j]) {
                tile_add(bkr_tile_highlights, 0, 0, TILE_SIZE, TILE_SIZE, i*TILE_SIZE, j*TILE_SIZE, HIGHLIGHT_DEPTH);
            }
        }
    }
}
