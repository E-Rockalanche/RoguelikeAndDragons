var alive = 0;
for (var n = 0; n < ds_list_size(player_list); n++) {
    var player = player_list[| n];
    if !ActorIsDead(player) {
        alive++;
    }
}
return alive;
