var attack = argument0;

var attacker = attack[? "attacker"];

var i0 = attacker.i;
var j0 = attacker.j;

var hit_list = ds_list_create();

for(var d = 0; d < 8; d++) {
    var i = i0 + x_dirs[d];
    var j = j0 + y_dirs[d];
    if MapDiagFree(map, i0, j0, i, j) {
        var actor = MapGetActor(map, i, j);
        if ((actor != NULL) && (actor.alliance != attacker.alliance)) {
            ds_list_add(hit_list, actor);
        }
    }
}

return hit_list;
