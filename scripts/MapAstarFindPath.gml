with(argument0) {
    var actor = argument1;
    var goal_x = argument2;
    var goal_y = argument3;
    var x0 = actor.i;
    var y0 = actor.j;
    
    mapCellSetOpen(x0, y0, NULL, 0, getTileDistance(x0, y0, goal_x, goal_y));
    var found = mapAstarFindGoal(actor, goal_x, goal_y);
    mapResetPathfinding();
    return found;
}
