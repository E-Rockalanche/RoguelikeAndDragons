with(argument0) {
    assert(path_stack != NULL, "path stack is null");
    assert(ds_stack_size(path_stack), "path stack is empty");
    
    previous_i = i;
    previous_j = j;
    
    var point = ds_stack_pop(path_stack);
    i = PointGetX(point);
    j = PointGetY(point);
    
    hspeed = (i - previous_i)*TILE_SIZE/MOVE_TIME;
    vspeed = (j - previous_j)*TILE_SIZE/MOVE_TIME;
    
    distance_moved += 1 + (i != previous_i && j != previous_j)*0.5;
    
    alarm[0] = MOVE_TIME;
    state = ActorState.MOVING;
}
