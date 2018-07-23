var count = 0;
for (var n = 0; n < ds_list_size(actor_list); n++) {
    var actor = actor_list[| n];
    if (actor.in_view && !actor.is_player && ActorIsAlive(actor)) {
        count++;
    }
}
return count;
