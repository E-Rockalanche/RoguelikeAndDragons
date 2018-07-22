current_round++;
ds_queue_clear(round_queue);
for(var index = 0; index < ds_list_size(actor_list); index++) {
    ds_queue_enqueue(round_queue, actor_list[| index]);
}
state = GameState.NEXT_TURN;
