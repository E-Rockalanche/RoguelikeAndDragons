/*
executed by obj_game
*/
assert(object_index == obj_game, "aiTurn() not being executed by obj_game");

var enemy_list = ds_list_create();
for(var index = 0; index < ds_list_size(actor_list); index++) {
    var cur = actor_list[| index];
    if (current_actor.alliance != cur.alliance) {
        ds_list_add(enemy_list, cur);
    }
}

if (ds_list_empty(enemy_list)) {
    gameEndTurn();
} else {
    //get adjacent enemy with least health
    var target = NULL;
    var adjacent_list = MapGetAdjacentActors(map, current_actor.i, current_actor.j);
    for(var n = 0; n < ds_list_size(adjacent_list); n++) {
        var actor = adjacent_list[| n];
        if (actor.alliance != current_actor.alliance)
                && MapDiagFree(map, current_actor.i, current_actor.j, actor.i, actor.j) {
            if (target == NULL || (actor.hp < target.hp)) {
                target = actor;
            }
        }
    }
    ds_list_destroy(adjacent_list);
    
    if (target != NULL) {
        show_debug_message(current_actor.name + " attacking " + target.name);
        
        ActorAttack(current_actor, target);
        state = GameState.ACTOR_ATTACKING;
        gameSetAnimation(ATTACK_TIME);
        current_actor.state = ActorState.ATTACKING;
    } else {
        var path = MapGetPathToClosestActor(map, current_actor, enemy_list);
        if (path != NULL) {
            show_debug_message("enemy path size = " + string(PathSize(path)));
            
            gameMoveActor(path);
        } else {
            gameSetAnimation(NO_ACTION_TIME);
            gameEndTurn();
        }
    }
}

ds_list_destroy(enemy_list);
