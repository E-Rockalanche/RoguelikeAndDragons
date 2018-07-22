with(argument0) {
    var blob = ds_grid_create(width-2, height-2);
    for(var seed_chance = 30; seed_chance <= 100; seed_chance += 10) {
        ds_grid_generate_blobs(blob, seed_chance, 5, 4, 6);
        for(var i = 0; i < width-2; i++) {
            for(var j = 0; j < height-2; j++) {
                if (blob[# i, j] == 1) {
                    blob[# i, j] = 2;
                } else if (blob[# i, j] == 0) {
                    var found_open = false;
                    for(var d = 0; d < 8; d++) {
                        var ii = i + x_dirs[d];
                        var jj = j + y_dirs[d];
                        if (withinBounds(ii, jj, 0, 0, width-2, height-2)) {
                            if (blob[# ii, jj] > 0) {
                                found_open = true;
                                break;
                            }
                        }
                    }
                    if (found_open) {
                        blob[# i, j] = -1;
                    }
                }
            }
        }
    }
    for(var i = 0; i < width-2; i++) {
        for(var j = 0; j < height-2; j++) {
            if (blob[# i, j]) {
                tile_grid[# i + 1, j + 1] = Tile.FLOOR;
            }
        }
    }
    ds_grid_destroy(blob);
    
    var room_list = mapGetOpenSpaces();
    
    ds_list_shuffle(room_list);
    for(var n = 0; n < ds_list_size(room_list); n++) {
        var cell_list0 = room_list[| n];
        var cell_list1 = room_list[| (n + 1) mod ds_list_size(room_list)];
        var cell0 = ds_list_get_random(cell_list0);
        var cell1 = ds_list_get_random(cell_list1);
        mapDrawHallway(PointGetX(cell0), PointGetY(cell0), PointGetX(cell1), PointGetY(cell1));
    }
    ds_list_destroy(room_list);
    
    mapPlaceGrass();
    
    MapSetTileFlags(id);
    
    background = bkr_tiles_cave;
    MapPlaceTiles(id);
}
