with(argument0) {
    for(var i = 0; i < width; i++) {
        for(var j = 0; j < height; j++) {
            var tile = tile_grid[# i, j];
            if (tile == Tile.WALL && chance(5)) {
                tile = Tile.WALL_DECAL;
            } else if (tile == Tile.FLOOR && chance(5)) {
                tile = Tile.FLOOR_DECAL;
            }
            
            var left = (tile mod 16) * TILE_SIZE;
            var top = (tile div 16) * TILE_SIZE;
            tile_add(background, left, top, TILE_SIZE, TILE_SIZE, i*TILE_SIZE, j*TILE_SIZE, TILE_DEPTH);
        }
    }
}
