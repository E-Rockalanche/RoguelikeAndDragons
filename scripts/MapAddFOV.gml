with(argument[0]) {
    var view_list = argument[1];
    var flags = TileFlag.DISCOVERED;
    if (argument_count > 2) {
        if (argument[2]) {
            MapClearActiveView(argument[0]);
            flags |= TileFlag.IN_ACTIVE_VIEW;
            active_view = view_list;
        }
    }
    
    assert(view_list != NULL, "Adding null FOV");
    
    for(var index = 0; index < ds_list_size(view_list); index++) {
        var point = view_list[| index];
        var i = PointGetX(point);
        var j = PointGetY(point);
        view_grid[# i, j] += 1;
        ds_grid_set_flag(flag_grid, i, j, flags);
    }
    
    //set actor flags
    for(var index = 0; index < ds_list_size(actor_list); index++) {
        var actor = actor_list[| index];
        
        ActorSetVisible(actor, view_grid[# actor.i, actor.j] > 0);
    }
}
