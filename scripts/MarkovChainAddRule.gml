var rules = argument0;
var key = argument1;
var value = argument2;

var list = NULL;
if (ds_map_exists(rules, key)) {
    list = rules[? key];
} else {
    list = ds_list_create();
    ds_map_add_list(rules, key, list);
}
if (ds_list_find_index(list, value) < 0) {
    ds_list_add(list, value);
}
