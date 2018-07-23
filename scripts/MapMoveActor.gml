with(argument0) {
    var actor = argument1;
    assert(actor != NULL, "moving null actor");
    
    var point = PathNext(actor.path_stack);
    var i = PointGetX(point);
    var j = PointGetY(point);
    
    assert(i != actor.i || j != actor.j, actor.name+" moving into current position");
    
    var other_actor = MapGetActor(id, i, j);
    if (other_actor != NULL) {
        assert(actor.alliance == other_actor.alliance, "Moving "+actor.name+" into position with "+other_actor.name);
        
        var path = Path();
        PathPushPoint(path, actor.i, actor.j);
        ActorSetPath(other_actor, path);
        ActorMove(other_actor);
    } else {
        ds_grid_unset_flag(flag_grid, actor.i, actor.j, TileFlag.HAS_ACTOR);
        ds_grid_set_flag(flag_grid, i, j, TileFlag.HAS_ACTOR);
    }
    
    ActorMove(actor);
}
