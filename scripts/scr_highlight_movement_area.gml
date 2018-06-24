with (argument0) {
    var x0 = argument1;
    var y0 = argument2;
    var distance = argument3;
    
    var open_list = ds_priority_create();
    var closed_list = ds_list_create();
    
    ds_priority_add(open_list, Point(x0, y0), 0);
    ds_grid_clear(movement_grid, false);
    
    while(ds_priority_size(open_list)) {
        var point = ds_priority_delete_min(open_list);
        movement_grid[# point[0], point[1]] = true;
        var current_g_cost = g_cost_grid[# point[0], point[1]];
        if (current_g_cost < distance) {
            for(var d = 0; d < 8; d++) {
                var i = point[0] + dirs[d, 0];
                var j = point[1] + dirs[d, 1];
                
                var g_cost = current_g_cost + 1 + (d >= 4)/2;
                
                if (MapPositionIsFree(argument0, i, j) && g_cost <= distance) {
                    
