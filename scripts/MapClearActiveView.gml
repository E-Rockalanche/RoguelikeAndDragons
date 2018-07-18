with(argument0) {
    if (active_view != NULL) {
        show_debug_message("Clearing active FOV "+string(active_view));
        for(var index = 0; index < ds_list_size(active_view); index++) {
            var point = active_view[| index];
            var i = PointGetX(point);
            var j = PointGetY(point);
            ds_grid_unset_flag(flag_grid, i, j, TileFlag.IN_ACTIVE_VIEW);
        }
        active_view = NULL;
    } else {
        show_debug_message("No active view to clear");
    }
}
