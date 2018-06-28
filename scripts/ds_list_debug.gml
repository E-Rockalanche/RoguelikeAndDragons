var list = argument0;
var str = "";
for(var i = 0; i < ds_list_size(list); i++) {
    if (i > 0) str += ", ";
    str += list[| i];
}
show_debug_message(str);
