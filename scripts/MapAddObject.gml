with(argument0) {
    var object = argument1;
    var i = argument2;
    var j = argument3;
    assert(object != NULL, "Adding null object to map");
    assert(withinBounds(i, j, 0, 0, width, height), "adding object outside map bounds");
    ds_list_add(object_list, object);
    ds_grid_set_flag(flag_grid, i, j, TileFlag.HAS_OBJECT);
}
