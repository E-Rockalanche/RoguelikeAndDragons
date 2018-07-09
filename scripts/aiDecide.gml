/*
executed by obj_game
*/
var actor = argument0;

var enemy_list = ds_list_create();
for(var index = 0; index < ds_list_size(actor_list); index++) {
    var cur = actor_list[| index];
    if (actor.alliance != cur.alliance) {
        ds_list_add(enemy_list, cur);
    }
}

//get adjacent enemy with least health
var target = NULL;
for(var index = 0; index < ds_list_size(enemy_list); index++) {
    var enemy = enemy_list[| index];
    if (getTileDistance(actor.i, actor.j, enemy.i, enemy.j) <= 1.5) {
        if (target == NULL || (enemy.hp < target.hp)) {
            target = enemy;
        }
    }
}
ds_list_destroy(enemy_list);

if (target != NULL) {
    ActorAttack(actor, target);
    state = GameState.ACTOR_ATTACKING;
    gameSetAnimation(ATTACK_TIME);
    actor.state = ActorState.ATTACKING;
} else {
    gameSetAnimation(MOVE_TIME);
    actor.state = ActorState.WAITING;
    state = GameState.NEXT_TURN;
}
