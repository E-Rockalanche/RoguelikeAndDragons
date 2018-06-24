/*
Executed by obj_map
*/
var i = argument0;
var j = argument1;
for(var index = 0; index < ds_list_size(actor_list); index++) {
    var actor = actor_list[| index];
    if (actor.i == i && actor.j == j) {
        return actor;
    }
}
return NULL;
