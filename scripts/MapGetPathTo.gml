with(argument0) {
    var i = argument1;
    var j = argument2;
    if (!withinBounds(i, j, 0, 0, width, height)) return NULL;
    
    var path = ds_stack_create();
    
    //ensure actor does not stop on position with another actor
    while(!MapPositionEmpty(argument0, i, j) && parent_grid[# i, j] != NULL) {
        var parent_point = parent_grid[# i, j];
        i = PointGetX(parent_point);
        j = PointGetY(parent_point);
    }
    
    while(parent_grid[# i, j] != NULL) {
        ds_stack_push(path, Point(i, j));
        var parent_point = parent_grid[# i, j];
        i = PointGetX(parent_point);
        j = PointGetY(parent_point);
    }
    
    return path;
}
