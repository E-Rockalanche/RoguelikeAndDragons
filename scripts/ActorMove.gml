/*
Note: Should use MapMoveActor() during exploration state
*/

with(argument0) {
    assert(path_stack != NULL, "path stack is null");
    assert(ds_stack_size(path_stack), "path stack is empty");
    
    var point = ds_stack_pop(path_stack);
    ActorSetPosition(id, PointGetX(point), PointGetY(point));
    
    var tile = map.tile_grid[# i, j];
    distance_moved += ActorGetTileCost(id, tile) * (1 + (i != previous_i && j != previous_j)*0.5);
    
    ActorSetVisible(id, map.view_grid[# i, j]);
    
    if (in_view || was_in_view || is_player) {
        hspeed = (i - previous_i)*TILE_SIZE/MOVE_TIME;
        vspeed = (j - previous_j)*TILE_SIZE/MOVE_TIME;
        
        alarm[0] = MOVE_TIME;
        state = ActorState.MOVING;
    } else {
        x = (0.5 + i) * TILE_SIZE;
        y = (0.5 + j) * TILE_SIZE;
    }
}
