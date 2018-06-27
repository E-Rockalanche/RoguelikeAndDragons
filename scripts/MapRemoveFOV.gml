with(argument[0]) {
    var view_list = argument[1];
    var flags = 0;
    if (argument_count > 2) {
        if (argument[2]) {
            flags |= TileFlag.IN_ACTIVE_VIEW;
        }
    }
    
    assert(view_list != NULL, "Removing null FOV");
    
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
        
        if !view_grid[# i, j] {
            if actor.in_view {
                actor.was_in_view = true;
                actor.in_view = false;
            }
        }
    }
}
