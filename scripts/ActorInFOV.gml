with(argument0) {
    var fov = argument1;
    
    for(var n = 0; n < ds_list_size(fov); n++) {
        var point = fov[| n];
        if (PointGetX(point) == i && PointGetY(point) == j) {
            return true;
        }
    }
}
return false;
