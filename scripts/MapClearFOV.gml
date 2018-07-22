with(argument0) {
    ds_grid_clear(view_grid, 0);
    
    //set actor flags
    for(var index = 0; index < ds_list_size(actor_list); index++) {
        var actor = actor_list[| index];
        
        if actor.in_view {
            actor.was_in_view = true;
            actor.in_view = false;
        }
    }
}
