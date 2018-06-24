with(argument0) {
    var i = argument1;
    var j = argument2;
    if (ds_grid_has_flag(flag_grid, i, j, TileFlag.HAS_ACTOR)) {
        for(var index = 0; index < ds_list_size(actor_list); index++) {
            var actor = actor_list[| index];
            if (actor.i == i && actor.j == j) {
                return actor;
            }
        }
    }
    return NULL;
}   
