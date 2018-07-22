with(argument0) {
    ds_list_destroy_if_exists(view_list);
    view_list = MapGetFOV(map, i, j, ActorGetViewDistance(argument0), true);
}
