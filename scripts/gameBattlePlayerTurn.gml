current_actor.state = ActorState.THINKING;

if (mouse_clicked[0]) {
    var i = mouse_x div TILE_SIZE;
    var j = mouse_y div TILE_SIZE;
    if (withinBounds(i, j, 0, 0, map.width, map.height)) {
        var actor = MapGetActor(map, i, j);
        if (actor != NULL) {
            if (actor == current_actor) {
                //end turn
                state = GameState.END_PLAYER_TURN;
            } else if (actor.alliance != current_actor.alliance) {
                //attack
                var range = ActorGetAttackRange(current_actor) + 0.5;
                if (getTileDistance(current_actor.i, current_actor.j, actor.i, actor.j) <= range)
                        && ActorInFOV(actor, current_actor.view_list) {
                        
                    var attack_type = ActorGetAttackType(current_actor);
                    
                    var attack = TargetAttack(current_actor, attack_type, actor);
                    
                    var hit_list = AttackGetHitList(attack);
                    for(var n = 0; n < ds_list_size(hit_list); n++) {
                        var cur_actor = hit_list[| n];
                        ActorAttack(current_actor, cur_actor);
                    }
                    
                    ds_list_destroy(hit_list);
                    AttackDestroy(attack);
                        
                        
                    MapClearMovementArea(map);
                    state = GameState.ACTOR_ATTACKING;
                    gameSetAnimation(ATTACK_TIME);
                    current_actor.state = ActorState.ATTACKING;
                }
            }
        } else {
            //move
            var path = MapGetMovementAreaPathTo(map, i, j);
            if (path != NULL) {
                MapClearMovementArea(map);
                gameMoveActor(path);
            }
        }
    }
}
