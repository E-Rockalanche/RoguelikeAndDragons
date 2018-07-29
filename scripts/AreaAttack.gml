/*
arguments:
    0: attacking actor
    1: attack type
    2: list of positions
*/

var attack = Attack(argument0, argument1);
ds_map_add_list(attack, "cell_list", argument2);
return attack;
