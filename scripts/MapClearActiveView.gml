with(argument0) {
    var view_list = argument1;
    assert(view_list != NULL, "Unsetting null FOV");
    for(var index = 0; index < ds_list_size(view_list); index++) {
        var point = view_list[| index];
        var i = PointGetX(point);
        var j = PointGetY(point);
        ds_grid_unset_flag(flag_grid, i, j, TileFlag.IN_ACTIVE_VIEW);
    }
}
