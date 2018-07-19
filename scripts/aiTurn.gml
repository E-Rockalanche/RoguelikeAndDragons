/*
executed by obj_game
*/

var enemy_list = ds_list_create();
for(var index = 0; index < ds_list_size(actor_list); index++) {
    var cur = actor_list[| index];
    if (current_actor.alliance != cur.alliance) {
        ds_list_add(enemy_list, cur);
    }
}

//get adjacent enemy with least health
var target = NULL;
for(var index = 0; index < ds_list_size(enemy_list); index++) {
    var enemy = enemy_list[| index];
    if (getTileDistance(current_actor.i, current_actor.j, enemy.i, enemy.j) <= 1.5) {
        if (target == NULL || (enemy.hp < target.hp)) {
            target = enemy;
        }
    }
}

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
        
        moveActor(path);
    } else {
        endTurn();
    }
}
ds_list_destroy(enemy_list);
