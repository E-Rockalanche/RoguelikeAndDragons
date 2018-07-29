console_state("Turn Start");

if (current_actor.is_player) {
    MapSetActiveFOV(map, current_actor.view_list);
    shadow = MapDrawShadow(map, shadow, CURRENT_PLAYER_VIEW);
}

var stunned = ActorHasCondition(current_actor, Condition.STUNNED);
    
ActorConditionEffects(current_actor, ROUND_TIME);

if (ActorIsDead(current_actor)) {
    state = GameState.NEXT_TURN;
} else if (stunned) {
    state = GameState.NEXT_TURN;
    gameSetAnimation(NO_ACTION_TIME);
} else if (current_actor.is_player) {
    state = GameState.HIGHLIGHT_MOVE_AREA;
} else {
    state = GameState.AI_TURN;
}
