with(argument0) {
    var i = argument1;
    var j = argument2;
    
    var str = "Tile: " + tile_names[tile_grid[# i, j]];
    
    str += "#Open: " + string(open_grid[# i, j]);
    str += "#Closed: " + string(closed_grid[# i, j]);
    str += "#G cost: " + string(g_grid[# i, j]);
    str += "#Views: " + string(view_grid[# i, j]);
    
    var flags = flag_grid[# i, j];
    if (flags & TileFlag.HAS_ACTOR) {
        str += "#Actor: "+string(MapGetActor(argument0, i, j));
    }
    if (flags & TileFlag.SOLID) {
        str += "#Solid";
    }
    
    return str;
}
