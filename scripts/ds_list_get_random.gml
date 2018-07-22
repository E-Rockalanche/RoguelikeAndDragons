var list = argument0;
assert(ds_list_size(list), "Getting random value of empty list");
var index = irandom(ds_list_size(list)-1);
return list[| index];
