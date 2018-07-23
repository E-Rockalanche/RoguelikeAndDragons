current_round++;

ds_priority_clear(round_queue);
for(var n = 0; n < ds_list_size(actor_list); n++) {
    var actor = actor_list[| n];
    ds_priority_add(round_queue, actor, ActorGetAttributeMod(actor, Attribute.AGILITY) + irandom_range(1, 20));
}

SplashState("Round "+string(current_round));
gameSetAnimation(30);

state = GameState.NEXT_TURN;
