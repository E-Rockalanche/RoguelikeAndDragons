assert(object_index == obj_map, "mapAstarFindHallway() not being executed by obj_map");

var x0 = argument0;
var y0 = argument1;
var goal_x = argument2;
var goal_y = argument3;

mapCellSetOpen(x0, y0, NULL, 0, getTileDistance(x0, y0, goal_x, goal_y));

var WALL_COST = 1;
var FLOOR_COST = 1;
var NEW_HALLWAY_COST = 10;
var DEFAULT_COST = 1000;

while(ds_priority_size(open_list)) {
    var parent_point = ds_priority_delete_min(open_list);
    var parent_i = PointGetX(parent_point);
    var parent_j = PointGetY(parent_point);
    
    closed_grid[# parent_i, parent_j] = true;
    ds_list_add(closed_list, parent_point);
    
    if (parent_i == goal_x) && (parent_j == goal_y) {
        mapResetPathfinding();
        return true;
    }
    
    var parent_g_cost = g_grid[# parent_i, parent_j];
    for(var d = 0; d < 4; d++) {
        var i = parent_i + x_dirs[d];
        var j = parent_j + y_dirs[d];
        
        if !withinBounds(i, j, 1, 1, width-1, height-1)
            continue;
        
        if closed_grid[# i, j]
            continue;
            
        var cur_cost = DEFAULT_COST;
        switch(tile_grid[# i, j]) {
            case Tile.WALL:
                cur_cost = WALL_COST;
                for(var dd = 0; dd < 8; dd++) {
                    var ii = i + x_dirs[dd];
                    var jj = j + y_dirs[dd];
                    if !withinBounds(ii, jj, 1, 1, width-1, height-1)
                        continue;
                    if (tile_grid[# ii, jj] == Tile.FLOOR) {
                        cur_cost = NEW_HALLWAY_COST;
                        break;
                    }
                }
            break;
            case Tile.FLOOR:
                cur_cost = FLOOR_COST;
            break;
        }
        
        var child_g_cost = parent_g_cost + cur_cost;
        
        mapCellSetOpen(i, j, parent_point, child_g_cost, getTileDistance(i, j, goal_x, goal_y));
    }
}

mapResetPathfinding();
return false;
