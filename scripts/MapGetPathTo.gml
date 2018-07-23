with(argument0) {
    var i = argument1;
    var j = argument2;
    if (!withinBounds(i, j, 0, 0, width, height)) return NULL;
    
    var path = Path();
    
    var point = Point(i, j);
    while(parent_grid[# i, j] != NULL) {
        ds_stack_push(path, point);
        point = parent_grid[# i, j];
        i = PointGetX(point);
        j = PointGetY(point);
    }
    
    return path;
}
