var do_loop = true;
while(!animation && do_loop) {
    switch(state) {
        case ExploreState.MAP_TURN:
            console_state("MAP_TURN");
            
            if (new_enemy_in_sight) {
                gameStartBattle();
            } else {
                for(var n = 0; n < ds_list_size(actor_list); n++) {
                    var actor = actor_list[| n];
                    ActorConditionEffects(actor, 1);
                }
                state = ExploreState.PLAYER_TURN;
            }
            break;
            
        case ExploreState.PLAYER_TURN:
            var player = player_list[| 0];
            if (!PathEmpty(player.path_stack) && auto_move) {
                MapMoveActor(map, player);
                state = ExploreState.AI_TURN;
            } else if (mouse_clicked[0]) {
                var i = mouse_x div TILE_SIZE;
                var j = mouse_y div TILE_SIZE;
                if (withinBounds(i, j, 0, 0, map.width, map.height)) {
                    var actor = MapGetActor(map, i, j);
                    if (actor == player) {
                        state = ExploreState.AI_TURN;
                    } else if (actor == NULL || actor.is_player) {
                        if (MapPositionEmpty(map, i, j) || (actor != NULL && actor.is_player)) {
                            //move to position
                            if (MapAstarFindPath(map, player, i, j)) {
                                ActorSetPath(player, MapGetPathTo(map, i, j));
                                MapMoveActor(map, player);
                                state = ExploreState.AI_TURN;
                                auto_move = true;
                            }
                        }
                    }
                }
            }
            if (state == ExploreState.PLAYER_TURN) {
                do_loop = false;
            }
            break;
            
        case ExploreState.AI_TURN:
            console_state("AI_TURN");
            for(var n = 1; n < ds_list_size(player_list); n++) {
                var leader = player_list[| n-1];
                var player = player_list[| n];
                if (player.state == ActorState.WAITING) {
                    if (MapAstarFindPath(map, player, leader.i, leader.j)) {
                        ActorSetPath(player, MapGetPathTo(map, leader.i, leader.j));
                        var point = PathNext(player.path_stack);
                        var actor = MapGetActor(map, PointGetX(point), PointGetY(point));
                        if (actor != leader && (actor == NULL || actor.state != ActorState.MOVING)) {
                            MapMoveActor(map, player);
                        }
                    }
                }
            }
            gameSetAnimation(MOVE_TIME);
            alarm[2] = MOVE_TIME/2;
            state = ExploreState.MAP_TURN;
            break;
            
        default:
            assert(false, "exploration state "+string(state)+" not implemented");
            break;
    }
}
