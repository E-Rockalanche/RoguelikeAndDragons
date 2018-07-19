with(argument0) {
    var actor = argument1;
    var goalX = argument2;
    var goalY = argument3;
    var x0 = actor.i;
    var y0 = actor.j;
    
    mapCellSetOpen(x0, y0, NULL, 0, getTileDistance(x0, y0, goalX, goalY));
    var found = mapAstarFindGoal(actor, goalX, goalY);
    mapResetPathfinding();
    return found;
}
