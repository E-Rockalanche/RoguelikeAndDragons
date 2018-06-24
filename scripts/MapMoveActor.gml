with(argument0) {
    var actor = argument1;
    var i = argument2;
    var j = argument3;
    
    assert(MapPositionFree(argument0, i, j), "Moving actor to solid tile");
    
    ds_grid_unset_flag(flag_grid, actor.i, actor.j, TileFlag.HAS_ACTOR);
    ds_grid_set_flag(flag_grid, i, j, TileFlag.HAS_ACTOR);
    
    ActorSetPosition(actor, i, j);
}
