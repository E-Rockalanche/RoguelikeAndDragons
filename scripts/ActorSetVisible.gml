with(argument0) {
    was_in_view = in_view;
    in_view = argument1;
    visible = in_view;
    
    if (in_view) {
        if (state == ActorState.DORMANT) {
            state = ActorState.WAITING;
        }
        if (!discovered && !is_player) {
            discovered = true;
            new_enemy_in_sight = true;
            show_debug_message("New enemy in sight: "+name);
        }
    }
}
