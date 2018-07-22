with (argument0) {
    var i0 = argument1;
    var j0 = argument2;
    
    var list = ds_list_create();
    
    for(var d = 0; d < 8; d++) {
        var i = i0 + x_dirs[d];
        var j = j0 + y_dirs[d];
        var actor = MapGetActor(id, i, j);
        if (actor != NULL) {
            ds_list_add(list, actor);
        }
    }
    
    return list;
}
