assert(object_index == obj_map, "mapResetPathfinding() not being executed by obj_map");

//clear open tiles
while(ds_priority_size(open_list)) {
    var point = ds_priority_delete_min(open_list);
    var i = PointGetX(point);
    var j = PointGetY(point);
    open_grid[# i, j] = false;
}  

//clear closed tiles
for(var index = 0; index < ds_list_size(closed_list); index++) {
    var point = closed_list[| index];
    var i = PointGetX(point);
    var j = PointGetY(point);
    open_grid[# i, j] = false;
    closed_grid[# i, j] = false;
}
ds_list_clear(closed_list);
