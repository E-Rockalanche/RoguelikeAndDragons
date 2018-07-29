var attack = argument0;

var attacker = attack[? "attacker"];
var target = attack[? "target"];

var i1 = attacker.i;
var j1 = attacker.j;

var i2 = target.i;
var j2 = target.j;

var target_dir = point_direction(i1, j1, i2, j2) div 45;

var d = target_dir-1;
if (d < 0) di += 8;

var hit_list = ds_list_create();

repeat(3) {
    var i = i1 + x_dirs_in_order[d];
    var j = j1 + y_dirs_in_order[d];
    if MapDiagFree(map, i1, j1, i, j) {
        var actor = MapGetActor(map, i, j);
        if ((actor != NULL) && (actor.alliance != attacker.alliance)) {
            ds_list_add(hit_list, actor);
        }
    }
}

return hit_list;
