show_debug_message("Ending battle");

world_state = WorldState.EXPLORE;
state = ExploreState.PLAYER_TURN;

for(var n = 0; n < ds_list_size(actor_list); n++) {
    var actor = actor_list[| n];
    actor.discovered = false;
}

SplashState("End Combat");
var time = max(30, ViewFocusOnActor(view, player_list[| 0]));
gameSetAnimation(time);
