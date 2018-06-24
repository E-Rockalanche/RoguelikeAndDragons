with(argument0) {
    var i = argument1;
    var j = argument2;
    var max_radius = argument3 + 0.5;
    var add_walls = argument4;
    var in_water = argument5;
    
    /*
        \2|1/
        3\|/0
        --@--
        4/|\7
        /5|6\
    */
    
    var view = ds_list_create();
    var mask = ds_grid_create(width, height);
    mask[# i, j] = true// must have
    for(var octant = 0; octant < 8; octant++) {
        // view list, view mask, center x, center y, octant, max distance, start_column, start slope, end slope, add_walls, underwater fov
        mapScanOctantFOV(view, mask, i, j, octant, max_radius, 1, 0, 1, add_walls, in_water);
    }
    ds_list_add(view, Point(i, j, width));
    ds_grid_destroy(mask);
    return view;
}
