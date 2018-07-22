var list = argument0;
var i = argument1;
var j = argument2;
for(var index = 0; index < ds_list_size(list); index++) {
    var element = list[| index];
    if (element.i == i && element.j == j) {
        return element;
    }
}
return NULL;
