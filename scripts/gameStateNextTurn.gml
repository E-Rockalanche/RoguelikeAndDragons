current_actor = NULL;
while((current_actor == NULL || ActorIsDead(current_actor))
        && ds_queue_size(round_queue)) {
    current_actor = ds_queue_dequeue(round_queue);
}

if (current_actor == NULL || ActorIsDead(current_actor)) {
    state = GameState.NEXT_ROUND;
} else {
    show_debug_message(current_actor.name+"'s turn");
    
    current_actor.distance_moved = 0;
    current_actor.state = ActorState.THINKING;
    
    state = GameState.TURN_START;
    shadow = MapDrawShadow(map, shadow, false);
    if (current_actor.in_view || current_actor.is_player) {
        gameSetAnimation(ViewFocusOnActor(view, current_actor));
    }
}
