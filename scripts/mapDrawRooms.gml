var room_list = argument0;

for(var n = 0; n < ds_list_size(room_list); n++) {
    var rm = room_list[| n];
    
    for(var i = RoomGetLeft(rm); i <= RoomGetRight(rm); i++) {
        for(var j = RoomGetTop(rm); j <= RoomGetBottom(rm); j++) {
            tile_grid[# i, j] = Tile.FLOOR;
        }
    }
}
