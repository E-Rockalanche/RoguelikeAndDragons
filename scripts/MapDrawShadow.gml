with(argument0) {
    var time = current_time;
    var shadow = argument1;
    if (!surface_exists(shadow)) {
        shadow = surface_create(width, height);
    }
    
    surface_set_target(shadow);
    draw_clear_alpha(c_black, 1);
    draw_set_blend_mode(bm_subtract);
    
    for(var i = 0; i < width; i++) {
        for(var j = 0; j < height; j++) {
            var flags = flag_grid[# i, j];
            if (flags & TileFlag.IN_VIEW) {
                draw_set_alpha(1);
                draw_point_colour(i, j, c_white);
            } else if (flags & TileFlag.DISCOVERED) {
                draw_set_alpha(0.5);
                draw_point_colour(i, j, c_white);
            }
        }
    }
    surface_reset_target();
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(1);
    console_time("drew shadow", current_time - time);
    return shadow;
}
