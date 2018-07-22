while(!animation && (gamePlayersAlive() > 0)) {
    var break_from_loop = false;
    switch(state) {
        case GameState.NEXT_ROUND:
            gameStateNextRound();
            break;
        
        case GameState.NEXT_TURN:
            gameStateNextTurn();
            break;
        
        case GameState.TURN_START:
            gameStateTurnStart();
            break;
        
        case GameState.HIGHLIGHT_MOVE_AREA:
            MapSetMovementArea(map, current_actor);
            MapHighlightMovementArea(map);
            state = GameState.PLAYER_TURN;
            break;
        
        case GameState.PLAYER_TURN:
            if (DEBUG) {
                gameConsoleCommand();
            }
            gameStatePlayerTurn();
            break_from_loop = true;
            break;
        
        case GameState.AI_TURN:
            gameStateAiTurn();
            break;
        
        case GameState.MOVE_ACTOR:
            gameStateMoveActor();
            break;
        
        case GameState.ACTOR_ATTACKING:
            current_actor.state = ActorState.WAITING;
            if (current_actor.is_player) {
                state = GameState.END_PLAYER_TURN;
            } else {
                gameEndTurn();
            }
            break;
        
        case GameState.END_PLAYER_TURN:
            MapClearMovementArea(map);
            shadow = MapDrawShadow(map, shadow, false);
            gameEndTurn();
            break;
        
        default:
            assert(false, "Game state "+string(state)+" not implemented");
            break;
    }
    if (break_from_loop) {
        break;
    }
}
