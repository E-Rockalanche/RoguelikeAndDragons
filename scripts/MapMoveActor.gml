with(argument0) {
    var actor = argument1;
    assert(actor != NULL, "moving null actor");
    
    ds_grid_unset_flag(flag_grid, actor.i, actor.j, TileFlag.HAS_ACTOR);
    ActorMove(actor);
    assert(MapPositionEmpty(argument0, actor.i, actor.j), "Moving actor to non-empty tile");
    ds_grid_set_flag(flag_grid, i, j, TileFlag.HAS_ACTOR);
}
