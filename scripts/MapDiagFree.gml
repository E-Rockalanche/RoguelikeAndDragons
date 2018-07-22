with(argument0) {
    var i0 = argument1;
    var j0 = argument2;
    var i1 = argument3;
    var j1 = argument4;
    if (flag_grid[# i0, j1] & TileFlag.SOLID) return false;
    return !(flag_grid[# i1, j0] & TileFlag.SOLID);
}
