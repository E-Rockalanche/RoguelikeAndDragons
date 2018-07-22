with(argument0) {
    var actor = argument1;
    assert(actor != NULL, "unsetting null actor from map");
    ds_grid_unset_flag(flag_grid, actor.i, actor.j, TileFlag.HAS_ACTOR);
}
