with (argument0) {
    var x0 = argument1;
    var y0 = argument2;
    var num_required = argument3;
    
    var distance = ActorGetMoveDistance(actor) + MOVE_DISTANCE_FUDGE;
    
    if (movement_area_set) {
        MapClearMovementArea(argument0);
    }
    
    mapCellSetOpen(x0, y0, NULL, 0, 0);
    ds_grid_clear(movement_grid, false);
    
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
            
            if (closed_grid[# i, j]
                    || open_grid[# i, j]
                    || (flags & TileFlag.SOLID)
                    || !MapDiagFree(argument0, parent_i, parent_j, i, j)) {
                continue;
            }
            
            if (flags & TileFlag.HAS_ACTOR) {
                var other_actor = findAtCoordsInList(actor_list, i, j);
                if (other_actor.alliance != actor.alliance) {
                    continue;
                }
            }
            
            var cur_cost = ActorGetTileCost(actor, tile_grid[# i, j]) * (1 + (d >= 4)/2);
            var child_g_cost = parent_g_cost + cur_cost;
                
            if (child_g_cost <= distance) {
                mapCellSetOpen(i, j, parent_point, child_g_cost, 0);
            }
        }
    }
    
    mapResetPathfinding();
    movement_area_set = true;
}
