console_state("Next Turn");

new_enemy_in_sight = false;

if (gameEnemiesInViewCount() == 0) {
    gameEndBattle();
} else {
    current_actor = NULL;
    while(ds_priority_size(round_queue)
            && (current_actor == NULL
            || ActorIsDead(current_actor)
            || (current_actor.state == ActorState.DORMANT))) {
        current_actor = ds_priority_delete_min(round_queue);
    }
    
    if (current_actor == NULL || ActorIsDead(current_actor) || (current_actor.state == ActorState.DORMANT)) {
        state = GameState.NEXT_ROUND;
    } else {
        show_debug_message(current_actor.name+"'s turn");
        
        current_actor.distance_moved = 0;
        current_actor.state = ActorState.THINKING;
        
        state = GameState.TURN_START;
        shadow = MapDrawShadow(map, shadow, ALL_PLAYER_VIEWS);
        if (current_actor.in_view || current_actor.is_player) {
            gameSetAnimation(ViewFocusOnActor(view, current_actor));
        }
    }
}
