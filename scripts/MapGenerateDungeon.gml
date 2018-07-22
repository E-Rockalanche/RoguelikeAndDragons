with(argument0) {
    ds_grid_set_region(tile_grid, 0, 0, width-1, height-1, Tile.WALL);
    
    var room_list = RoomBSP(Room(1, 1, width-2, height-2), 4, 4, 12, 12, 2);
    
    ds_list_shuffle(room_list);
    var num_to_remove = round(ds_list_size(room_list)/3);
    repeat(num_to_remove) {
        ds_list_delete(room_list, ds_list_size(room_list)-1);
    }
    
    mapDrawRooms(room_list);
    
    mapConnectRooms(room_list);
    
    mapPlaceGrass();
    
    MapSetTileFlags(id);
    
    background = bkr_tiles_sewer;
    MapPlaceTiles(id);
}
