console_state("Move Actor");

if (new_enemy_in_sight && current_actor.is_player) {
    state = GameState.HIGHLIGHT_MOVE_AREA;
    new_enemy_in_sight = false;
    show_debug_message("Stopping because a new enemy is in sight");
    MapSetActor(map, current_actor);
} else if (PathSize(current_actor.path_stack)) {
    var do_animation;
    do{
        if (!current_actor.in_view && view.actor != current_actor) {
            var point = PathNext(current_actor.path_stack);
            var i = PointGetX(point);
            var j = PointGetY(point);
            if map.view_grid[# i, j] {
                gameSetAnimation(ViewFocusOnActor(view, current_actor));
                exit;
            }
        }
        ActorMove(current_actor);
        do_animation = (current_actor.in_view || current_actor.was_in_view || current_actor.is_player);
    }until(do_animation || PathEmpty(current_actor.path_stack));
    if(!do_animation) {
        assert(!current_actor.is_player, current_actor.name+" isn't doing a walking animation");
        MapSetActor(map, current_actor);
        current_actor.state = ActorState.WAITING;
        state = GameState.AI_TURN;
    } else {
        if (current_actor.is_player) {
            alarm[1] = MOVE_TIME/2;
        }
        gameSetAnimation(MOVE_TIME);
    }
} else {
    MapSetActor(map, current_actor);
    current_actor.state = ActorState.WAITING;
    if (current_actor.is_player) {
        state = GameState.HIGHLIGHT_MOVE_AREA;
    } else {
        state = GameState.AI_TURN;
    }
}
