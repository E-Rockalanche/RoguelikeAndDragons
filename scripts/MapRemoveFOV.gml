with(argument0) {
    var view_list = argument1;
    assert(view_list != NULL, "Removing null FOV");
    
    var flags = 0;
    if (view_list == active_view) {
        flags |= TileFlag.IN_ACTIVE_VIEW;
        active_view = NULL;
    }
    
    for(var index = 0; index < ds_list_size(view_list); index++) {
        var point = view_list[| index];
        var i = PointGetX(point);
        var j = PointGetY(point);
        view_grid[# i, j] -= 1;
        ds_grid_unset_flag(flag_grid, i, j, flags);
    }
    ds_list_destroy(view_list);
    
    //set actor flags
    for(var index = 0; index < ds_list_size(actor_list); index++) {
        var actor = actor_list[| index];
        
        ActorSetVisible(actor, view_grid[# actor.i, actor.j] > 0);
    }
}
