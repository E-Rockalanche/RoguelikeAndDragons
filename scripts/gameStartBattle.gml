show_debug_message("Starting battle");

world_state = WorldState.BATTLE;
do_loop = false;
current_round = 0;
current_actor = NULL;
player_turn = false;
new_enemy_in_sight = false;
auto_move = false;

SplashState("Battle!");
gameSetAnimation(30);
