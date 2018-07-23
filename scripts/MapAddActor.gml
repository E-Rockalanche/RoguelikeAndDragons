with(argument0) {
    var actor = argument1;
    var i = argument2;
    var j = argument3;
    assert(actor != NULL, "Adding null actor to map");
    assert(withinBounds(i, j, 0, 0, width, height), "adding actor outside map bounds");
    ds_list_add(actor_list, actor);
    actor.map = id;
    actor.i = i;
    actor.j = j;
    actor.x = (0.5 + i) * TILE_SIZE;
    actor.y = (0.5 + j) * TILE_SIZE;
    ds_grid_set_flag(flag_grid, i, j, TileFlag.HAS_ACTOR);
}
