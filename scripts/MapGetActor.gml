with(argument0) {
    var i = argument1;
    var j = argument2;
    if (ds_grid_has_flag(flag_grid, i, j, TileFlag.HAS_ACTOR)) {
        return findAtCoordsInList(actor_list, i, j);
    }
    return NULL;
}   
