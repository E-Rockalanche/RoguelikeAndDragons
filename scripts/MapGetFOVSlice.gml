with(argument0) {
    var i = argument1;
    var j = argument2;
    var view_direction = argument3;
    var angle = argument4;
    var max_radius = argument5 + 0.5;
    var add_walls = argument6;
    
    /*
        \2|1/
        3\|/0
        --@--
        4/|\7
        /5|6\
    */
    
    var view = ds_list_create();
    var mask = ds_grid_create(width, height);
    mask[# i, j] = true;
    ds_list_add(view, Point(i, j));
    
    var start_angle = view_direction - (angle / 2);
    var end_angle = view_direction + (angle / 2);
    
    if (start_angle < 0) start_angle += 360;
    
    var start_octant = angleGetOctant(start_angle);
    var end_octant = angleGetOctant(end_angle);
    
    if (start_octant > end_octant) end_octant += 8;
    
    for(var o = start_octant; o <= end_octant; o++) {
        var start_slope = 0;
        var end_slope = 1;
        
        if (o == start_octant) {
            var slope = angleGetOctantSlope(start_angle);
            if (o mod 2 == 0) {
                start_slope = slope;
            } else {
                end_slope = slope;
            }
        }
        
        if (o == end_octant) {
            var slope = angleGetOctantSlope(end_angle);
            if (o mod 2 == 0) {
                end_slope = slope;
            } else {
                start_slope = slope;
            }
        }
        
        var octant = o mod 8;
        mapScanOctantFOV(view, mask, i, j, octant, max_radius, 1, start_slope, end_slope, add_walls);
    }
    ds_grid_destroy(mask);
    return view;
}
