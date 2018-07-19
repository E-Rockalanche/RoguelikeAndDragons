with(argument0) {
    var actor = argument1;
    var actor_list = argument2;
    var list_size = ds_list_size(actor_list);
    assert(list_size > 0, "MapGetPathToClosestActor has empty actor list");
    
    for(var index = 0; index < list_size; index++) {
        var cur_actor = actor_list[| index];
        for(var d = 0; d < 8; d++) {
            var i = cur_actor.i + x_dirs[d];
            var j = cur_actor.j + y_dirs[d];
            if (MapPositionEmpty(argument0, i, j)) {
                mapCellSetOpen(i, j, NULL, 0, getTileDistance(i, j, actor.i, actor.j));
            }
        }
    }
    
    var found = mapAstarFindGoal(actor, actor.i, actor.j);
    mapResetPathfinding();
    
    if (found) {
        var path = Path();
        var i = actor.i;
        var j = actor.j;
        var cost = 0;
        while(parent_grid[# i, j] != NULL) {
            var parent_point = parent_grid[# i, j];
            i = PointGetX(parent_point);
            j = PointGetY(parent_point);
            cost += ActorGetTileCost(actor, tile_grid[# i, j]);
            if (cost <= ActorGetMoveDistance(actor)) {
                ds_stack_push(path, parent_point);
            }
        }
        
        //ensure actor stops in free position
        var done;
        do {
            done = true;
            if (ds_stack_size(path)) {
                var top = ds_stack_top(path);
                if !MapPositionEmpty(argument0, PointGetX(top), PointGetY(top)) {
                    ds_stack_pop(path);
                    done = false;
                }
            }
        } until(done);
        
        if (PathSize(path)) {
            return ds_stack_reverse(path);
        } else {
            PathDestroy(path);
        }
    }
    return NULL;
}
