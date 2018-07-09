with(argument0) {
    actor = argument1;
    x0 = x;
    y0 = y;
    x1 = actor.x;
    y1 = actor.y;
    move_time = max(1, floor(sqrt(point_distance(x0, y0, x1, y1))));
    tween = 0;
    state = ViewState.MOVE_FOCUS_TO_ACTOR;
    
    return move_time;
}
