var rules = argument0;
var key = argument1;
assert(ds_map_exists(rules, key), "Markov chain key '"+key+"' does not exist");
return ds_list_get_random(rules[? key]);
