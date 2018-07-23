show_debug_message("Ending battle");

world_state = WorldState.EXPLORE;
state = ExploreState.PLAYER_TURN;

SplashState("End Combat");
gameSetAnimation(30);
