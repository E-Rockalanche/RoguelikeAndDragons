var attack = argument0;
var attacker = attack[? "attacker"];
var target = attack[? "tagret"];

var i1 = attacker.i;
var j1 = attacker.j;

var i2 = target.i;
var j2 = target.j;

var i_diff = i2 - i1;
var j_diff = j2 - j1;

if (max(abs(i_diff), abs(j_diff)) < 2) {
    i_diff *= 2;
    j_diff *= 2;
}

var hit_list = ds_list_create();
var i_last, j_last;
var i = i1;
var j = j1;
var ok = true;
while(ok) {
    i_last = i;
    j_last = j;
    i += sign(i_diff);
    j += sign(j_diff);
    i_diff -= sign(i_diff);
    j_diff -= sign(j_diff);
    if (MapPositionFree(map, i, j) && MapDiagFree(map, i_last, j_last, i, j)) {
        var actor = MapGetActor(map, i, j);
        if (actor != NULL) && (actor.alliance != attacker.alliance) {
            ds_list_add(hit_list, actor);
        }
    } else {
        ok = false;
    }
}

return hit_list;
