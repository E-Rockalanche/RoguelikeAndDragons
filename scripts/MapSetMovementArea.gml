with (argument0) {
    var time = current_time;
    var actor = argument1;
    var x0 = actor.i;
    var y0 = actor.j;
    
    var distance = ActorGetMoveDistance(actor);
    
    if (movement_area_set) {
        MapClearMovementArea(argument0);
    }
    
    ds_priority_add(open_list, Point(x0, y0), 0);
    ds_grid_clear(movement_grid, false);
    g_grid[# x0, y0] = 0;
    open_grid[# x0, y0] = true;
    parent_grid[# x0, y0] = NULL;
    
    while(ds_priority_size(open_list)) {
        var parent_point = ds_priority_delete_min(open_list);
        var parent_i = PointGetX(parent_point);
        var parent_j = PointGetY(parent_point);
        
        if (!ds_grid_has_flag(flag_grid, parent_i, parent_j, TileFlag.HAS_ACTOR)){
            movement_grid[# parent_i, parent_j] = true;
        }
        
        closed_grid[# parent_i, parent_j] = true;
        ds_list_add(closed_list, parent_point);
        var parent_g_cost = g_grid[# parent_i, parent_j];
        for(var d = 0; d < 8; d++) {
            var i = parent_i + dirs[d, 0];
            var j = parent_j + dirs[d, 1];
            var flags = flag_grid[# i, j];
            
            if (closed_grid[# i, j] || open_grid[# i, j] || (flags & TileFlag.SOLID))
                continue;
            
            if (flags & TileFlag.HAS_ACTOR) {
                var other_actor = mapFindActor(i, j);
                if (other_actor.alliance != actor.alliance)
                    continue;
            }
            
            var child_g_cost = parent_g_cost + 1 + (d >= 4)/2;
            if (floor(child_g_cost) <= distance) {
                MapCellSetOpen(argument0, i, j, parent_point, child_g_cost, 0);
            }
        }
    }
    for(var index = 0; index < ds_list_size(closed_list); index++) {
        var point = closed_list[| index];
        var i = PointGetX(point);
        var j = PointGetY(point);
        open_grid[# i, j] = false;
        closed_grid[# i, j] = false;
    }
    ds_list_clear(closed_list);
    movement_area_set = true;
    time = current_time - time;
    console_time("set movement area", time);
}
