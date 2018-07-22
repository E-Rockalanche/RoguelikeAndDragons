var str = argument0;
var args = argument1;

if (array_length_1d(args) > 1) {
    switch(args[1]) {
        case "enemies":
            for(var n = 0; n < ds_list_size(actor_list); n++) {
                var actor = actor_list[| n];
                if (actor.alliance != Alliance.GOOD) {
                    actor.hp = 0;
                    with(actor) actorDie();
                }
            }
            break;
            
        case "players":
            for(var n = 0; n < ds_list_size(player_list); n++) {
                var actor = player_list[| n];
                actor.hp = 0;
                with(actor) actorDie();
            }
            break;
            
        case "all":
            for(var n = 0; n < ds_list_size(actor_list); n++) {
                var actor = actor_list[| n];
                actor.hp = 0;
                with(actor) actorDie();
            }
            break;
            
        default:
            show_debug_message("Invalid command: "+str);
    }
} else {
    show_debug_message("Invalid command: "+str);
}
