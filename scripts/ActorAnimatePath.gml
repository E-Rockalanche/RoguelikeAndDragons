with(argument0) {
    var point = ds_stack_pop(path_stack);
    path_x0 = i;
    path_y0 = j;
    path_x1 = PointGetX(point);
    path_y1 = PointGetY(point);
    alarm[0] = MOVE_TIME;
}
