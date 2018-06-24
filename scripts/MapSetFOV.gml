with(argument0) {
    var time = current_time;
    var actor = argument1;
    assert(actor != NULL, "Setting view for null actor");
    
    // clear view
    for(var index = 0; index < ds_list_size(view_list); index++) {
        var point = view_list[| index];
        var i = PointGetX(point, width);
        var j = PointGetY(point, width);
        ds_grid_unset_flag(flag_grid, i, j, TileFlag.IN_VIEW);
    }
    ds_list_destroy(view_list);
    
    // set view
    view_list = MapGetFOV(argument0, actor.i, actor.j, ActorGetViewDistance(actor), true, false);
    
    for(var index = 0; index < ds_list_size(view_list); index++) {
        var point = view_list[| index];
        var i = PointGetX(point, width);
        var j = PointGetY(point, width);
        ds_grid_set_flag(flag_grid, i, j, TileFlag.IN_VIEW | TileFlag.DISCOVERED);
    }
    console_time("set fov", current_time - time);
}
