
assert(object_index == obj_game, "endTurn() not being executed by obj_game");

if (gameEnemiesInViewCount() == 0) {
    gameEndBattle();
} else {
    current_actor.state = ActorState.WAITING;
    state = GameState.NEXT_TURN;
}
