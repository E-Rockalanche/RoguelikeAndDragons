with(argument0) {
    var actor = argument1;
    assert(actor != NULL, "Removing null actor from map");
    ds_list_delete_value(actor_list, actor);
    ds_grid_unset_flag(flag_grid, actor.i, actor.j, TileFlag.HAS_ACTOR);
    actor.map = NULL;
}
