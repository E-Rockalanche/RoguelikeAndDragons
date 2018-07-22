with (argument0) {
    var x0 = argument1;
    var y0 = argument2;
    var num_required = argument3;
    
    mapCellSetOpen(x0, y0, NULL, 0, 0);
    cell_list = ds_list_create();
    
    while(ds_priority_size(open_list) && (ds_list_size(cell_list) < num_required)) {
        var parent_point = ds_priority_delete_min(open_list);
        var parent_i = PointGetX(parent_point);
        var parent_j = PointGetY(parent_point);
        
        if (!ds_grid_has_flag(flag_grid, parent_i, parent_j, TileFlag.HAS_ACTOR)){
            ds_list_add(cell_list, parent_point);
        }
        
        closed_grid[# parent_i, parent_j] = true;
        ds_list_add(closed_list, parent_point);
        var parent_g_cost = g_grid[# parent_i, parent_j];
        
        for(var d = 0; d < 8; d++) {
            var i = parent_i + x_dirs[d];
            var j = parent_j + y_dirs[d];
            var flags = flag_grid[# i, j];
            
            if (closed_grid[# i, j]
                    || open_grid[# i, j]
                    || (flags & TileFlag.SOLID)
                    || !MapDiagFree(argument0, parent_i, parent_j, i, j)) {
                continue;
            }
            
            var cur_cost = (1 + (d >= 4)/2);
            var child_g_cost = parent_g_cost + cur_cost;
                
            mapCellSetOpen(i, j, parent_point, child_g_cost, 0);
        }
    }
    
    mapResetPathfinding();
    return cell_list;
}
