assert(object_index == obj_map, "mapAstarFindGoal() not being executed by obj_map");

var actor = argument0;
var goal_x = argument1;
var goal_y = argument2;

while(ds_priority_size(open_list)) {
    var parent_point = ds_priority_delete_min(open_list);
    var parent_i = PointGetX(parent_point);
    var parent_j = PointGetY(parent_point);
    
    closed_grid[# parent_i, parent_j] = true;
    ds_list_add(closed_list, parent_point);
    
    if (parent_i == goal_x) && (parent_j == goal_y) {
        return true;
    }
    
    var parent_g_cost = g_grid[# parent_i, parent_j];
    for(var d = 0; d < 8; d++) {
        var i = parent_i + x_dirs[d];
        var j = parent_j + y_dirs[d];
        var flags = flag_grid[# i, j];
        
        if (closed_grid[# i, j] || (flags & TileFlag.SOLID) || !MapDiagFree(id, parent_i, parent_j, i, j))
            continue;
            
        if (flags & TileFlag.HAS_ACTOR) {
            var other_actor = findAtCoordsInList(actor_list, i, j);
            if (other_actor.alliance != actor.alliance) {
                continue;
            }
        }
        
        var cur_cost = ActorGetTileCost(actor, tile_grid[# i, j]) * (1 + (d >= 4)/2);
        var child_g_cost = parent_g_cost + cur_cost;
        
        mapCellSetOpen(i, j, parent_point, child_g_cost, getTileDistance(i, j, goal_x, goal_y));
    }
}
return false;
