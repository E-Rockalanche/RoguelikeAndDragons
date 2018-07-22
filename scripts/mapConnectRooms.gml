var room_list = argument0;

for(var n = 0; n < ds_list_size(room_list); n++) {
    var room0 = room_list[| n];
    var room1 = room_list[| (n+1) mod ds_list_size(room_list)];
    
    var x0 = RoomGetLeft(room0) + irandom(RoomGetWidth(room0)-1);
    var y0 = RoomGetTop(room0) + irandom(RoomGetHeight(room0)-1);
    var x1 = RoomGetLeft(room1) + irandom(RoomGetWidth(room1)-1);
    var y1 = RoomGetTop(room1) + irandom(RoomGetHeight(room1)-1);
    
    var found = mapAstarFindHallway(x0, y0, x1, y1);
    assert(found, "Cannot find path between rooms");
    
    var i = x1;
    var j = y1;
    while(parent_grid[# i, j] != NULL) {
        tile_grid[# i, j] = Tile.FLOOR;
        var parent_point = parent_grid[# i, j];
        i = PointGetX(parent_point);
        j = PointGetY(parent_point);
    }
}
