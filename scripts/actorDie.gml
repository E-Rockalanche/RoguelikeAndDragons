if (is_player) {
    MapRemoveFOV(map, view_list);
    ds_list_destroy(view_list);
    view_list = NULL;
}

MapRemoveActor(map, id);
sprite_index = spr_bones;
state = ActorState.DEAD;
ActorClearConditions(id);
