if (current_actor.is_player) {
    MapSetActiveFOV(map, current_actor.view_list);
    shadow = MapDrawShadow(map, shadow, true);
}
    
ActorConditionEffects(current_actor);

if (ActorHasCondition(current_actor, Condition.STUNNED)) {
    state = GameState.NEXT_TURN;
    gameSetAnimation(ANIMATION_TIME);
} else {
    if (ActorIsDead(current_actor)) {
        state = GameState.NEXT_TURN;
    } else {
        if (current_actor.is_player) {
            state = GameState.HIGHLIGHT_MOVE_AREA;
        } else {
            state = GameState.AI_TURN;
        }
    }
}

ActorReduceConditionTimers(current_actor, ROUND_TIME);
