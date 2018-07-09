with(argument0) {
    var actor = argument1;
    var goal_list = argument2;
    var list_size = ds_list_size(goal_list);
    assert(list_size > 0, "MapAsterFindClosestPath has empty goal list");
    
    for(var index = 1; index < list_size; index++) {
        var point = goal_list[| index];
        var i = PointGetX(i);
        var j = PointGetY(j);
        mapCellSetOpen(i, j, NULL, 0, getTileDistance(i, j, actor.i, actor.j));
    }
    
    var point = goal_list[| 0];
    var i = PointGetX(i);
    var j = PointGetY(j);
    return MapAstarFindPath(argument0, actor, i, j);
}
