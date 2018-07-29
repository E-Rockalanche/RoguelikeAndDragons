var cell_list = argument0[? "cell_list"];
var hit_list = ds_list_create();
for(var n = 0; n < ds_list_size(cell_list); n++) {
    var point = cell_list[| n];
    var actor = MapGetActor(map, PointGetX(point), PointGetY(point));
    if (actor != NULL) {
        ds_list_add(hit_list, actor);
    }
}
return hit_list;
