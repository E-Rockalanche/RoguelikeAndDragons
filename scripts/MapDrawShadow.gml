with(argument0) {
    var shadow = argument1;
    var focus_active_view = argument2;
    
    if (!surface_exists(shadow)) {
        shadow = surface_create(width, height);
    }
    
    var active_view_alpha = 1;
    var in_view_alpha = 1;
    var discovered_alpha = 0.333;
    if (focus_active_view) {
        in_view_alpha = 0.666;
    }
    
    surface_set_target(shadow);
    draw_clear_alpha(c_black, 1);
    draw_set_blend_mode(bm_subtract);
    
    for(var i = 0; i < width; i++) {
        for(var j = 0; j < height; j++) {
            var flags = flag_grid[# i, j];
            if (flags & TileFlag.IN_ACTIVE_VIEW) {
                draw_set_alpha(active_view_alpha);
                draw_point_colour(i, j, c_white);
            } else if (view_grid[# i, j]) {
                draw_set_alpha(in_view_alpha);
                draw_point_colour(i, j, c_white);
            } else if (flags & TileFlag.DISCOVERED) {
                draw_set_alpha(discovered_alpha);
                draw_point_colour(i, j, c_white);
            }
        }
    }
    
    surface_reset_target();
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(1);
    
    return shadow;
}
