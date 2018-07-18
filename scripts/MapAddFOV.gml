with(argument[0]) {
    var view_list = argument[1];
    var flags = TileFlag.DISCOVERED;
    if (argument_count > 2) {
        if (argument[2]) {
            MapClearActiveView(argument[0]);
            flags |= TileFlag.IN_ACTIVE_VIEW;
            active_view = view_list;
            show_debug_message("Adding FOV and setting to active "+string(view_list));
        }
    } else {
        show_debug_message("Adding FOV "+string(view_list));
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
        
        if view_grid[# i, j] {
            if (!actor.in_view && !actor.was_in_view) {
                new_enemy_in_sight = true;
            }
            actor.in_view = true;
        } else {
            if actor.in_view {
                actor.in_view = false;
                actor.was_in_view = true;
            } else {
                actor.was_in_view = false;
            }
        }
    }
}
