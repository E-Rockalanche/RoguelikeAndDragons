with(argument0) {
    var view_list = argument1;
    assert(view_list != NULL, "Setting null view as active");
    
    if (view_list != active_view) {
        if (active_view != NULL) {
            MapClearActiveView(argument0);
        }
        
        active_view = view_list;
        assert(active_view != NULL, "Setting null FOV");
        for(var index = 0; index < ds_list_size(active_view); index++) {
            var point = active_view[| index];
            var i = PointGetX(point);
            var j = PointGetY(point);
            ds_grid_set_flag(flag_grid, i, j, TileFlag.DISCOVERED | TileFlag.IN_ACTIVE_VIEW);
        }
    }
}
