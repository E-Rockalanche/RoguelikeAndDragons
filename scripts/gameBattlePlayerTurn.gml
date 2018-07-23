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
                if (getTileDistance(current_actor.i, current_actor.j, actor.i, actor.j) <= 1.5) {
                    if (MapDiagFree(map, actor.i, actor.j, current_actor.i, current_actor.j)) {
                        MapClearMovementArea(map);
                        ActorAttack(current_actor, actor);
                        state = GameState.ACTOR_ATTACKING;
                        gameSetAnimation(ATTACK_TIME);
                        current_actor.state = ActorState.ATTACKING;
                    }
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
