with(argument0) {
    var object = argument1;
    assert(object != NULL, "Removing null object from map");
    ds_list_delete_value(object_list, object);
    if (!findAtCoordsInList(object_list, object.i, object.j)) {
        ds_grid_unset_flag(flag_grid, i, j, TileFlag.HAS_OBJECT);
    }
}
