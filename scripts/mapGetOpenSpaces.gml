var copy = ds_grid_clone(tile_grid);
var min_id = Tile.LENGTH;
var num_rooms = 0;
var room_list = ds_list_create();
for(var i = 1; i < width-1; i++) {
    for(var j = 1; j < height-1; j++) {
        if (copy[# i, j] == Tile.FLOOR) {
            ds_grid_flood_fill(copy, i, j, min_id + num_rooms);
            ds_list_add(room_list, ds_list_create());
            ds_list_mark_as_list(room_list, ds_list_size(room_list)-1);
            num_rooms++;
        }
        if (copy[# i, j] >= min_id) {
            var cell_list = room_list[| copy[# i, j] - min_id];
            ds_list_add(cell_list, Point(i, j));
        }
    }
}
return room_list;
