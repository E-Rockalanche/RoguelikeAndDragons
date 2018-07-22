with(argument0) {
    var i = argument1;
    var j = argument2;
    if (withinBounds(i, j, 0, 0, width, height)
            && (flag_grid[# i, j] & TileFlag.HAS_ACTOR)) {
        return findAtCoordsInList(actor_list, i, j);
    }
    return NULL;
}   
