with (argument0) {
    var i = argument1;
    var j = argument2;
    return withinBounds(i, j, 0, 0, width, height)
        && !ds_grid_has_flag(flag_grid, i, j, TileFlag.SOLID);
}
