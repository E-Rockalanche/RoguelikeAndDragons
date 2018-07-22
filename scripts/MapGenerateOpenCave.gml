with(argument0) {
    ds_grid_set_region(tile_grid, 0, 0, width-1, height-1, Tile.WALL);
    
    var blob = tryBlob(width-2, height-2, 60, 100);
    var blob_width = ds_grid_width(blob);
    var blob_height = ds_grid_height(blob)
    var x_offset = 1 + irandom(width - 2 - blob_width);
    var y_offset = 1 + irandom(height - 2 - blob_height);
    
    for(var i = 0; i < blob_width; i++) {
        for(var j = 0; j < blob_height; j++) {
            if (blob[# i, j]) {
                var tile = Tile.FLOOR;
                tile_grid[# i + x_offset, j + y_offset] = tile;
            }
        }
    }
    ds_grid_destroy(blob);
    
    mapPlaceGrass();
    
    MapSetTileFlags(id);
    
    background = bkr_tiles_cave;
    MapPlaceTiles(id);
}
