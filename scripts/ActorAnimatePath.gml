with(argument0) {
    if (ds_stack_size(path_stack)) {
        state = ActorState.ANIMATE_PATH;
        alarm[0] = MOVE_TIME;
        var point = ds_stack_pop(path_stack);
        dest_i = PointGetX(point, map.width);
        dest_j = PointGetY(point, map.width);
        cur_i = i;
        cur_j = j;
        return (ds_stack_size(path_stack)+1) * MOVE_TIME;
    } else {
        state = ActorState.READY;
        return 0;
    }
}
