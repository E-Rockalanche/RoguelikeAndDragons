with(argument0) {
    var old_actor = actor;
    actor = argument1;
    if ((actor != old_actor) || (x != actor.x) || (y != actor.y)) {
        x0 = x;
        y0 = y;
        move_time = floor(sqrt(point_distance(x0, y0, actor.x, actor.y)));
        tween = 0;
        state = ViewState.MOVE_FOCUS_TO_ACTOR;
        
        return move_time;
    } else {
        state = ViewState.FOCUS_ON_ACTOR;
        return 0;
    }
}
