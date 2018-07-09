with(argument0) {
    for(var i = 0; i < width; i++) {
        for(var j = 0; j < height; j++) {
            if (movement_grid[# i, j]) {
                var index = 0;
                for(var d = 0; d < 4; d++) {
                    var ii = i + dirs[d, 0];
                    var jj = j + dirs[d, 1];
                    if (withinBounds(ii, jj, 0, 0, width, height)) {
                        if (movement_grid[# ii, jj]) {
                            index |= 1 << d;
                        }
                    }
                }
                tile_add(bkr_tile_highlights,
                    (index mod 4) * TILE_SIZE,
                    (index div 4) * TILE_SIZE,
                    TILE_SIZE,
                    TILE_SIZE,
                    i*TILE_SIZE,
                    j*TILE_SIZE,
                    HIGHLIGHT_DEPTH);
            }
        }
    }
}
