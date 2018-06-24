with(argument0) {
    var i = argument1;
    var j = argument2;
    var parent_point = argument3;
    var g_cost = argument4;
    var h_cost = argument5;
    var already_open = open_grid[# i, j];
    if (!already_open || (g_cost < g_grid[# i, j])) {
        var f_cost = g_cost + h_cost;
        g_grid[# i, j] = g_cost;
        parent_grid[# i, j] = parent_point;
        var child_point = Point(i, j, width);
        if (already_open) {
            ds_priority_change_priority(open_list, child_point, f_cost);
        } else {
            ds_priority_add(open_list, child_point, f_cost);
            open_grid[# i, j] = true;
        }
    }
}
