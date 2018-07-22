var str = argument0;
var args = argument1;

if (array_length_1d(args) > 1) {
    switch(args[1]) {
        case "all":
            ds_grid_add_region(map.view_grid, 0, 0, map.width-1, map.height-1, 1);
            shadow = MapDrawShadow(map, shadow, current_actor.is_player);
            break;
            
        default:
            show_debug_message("Invalid command: "+str);
    }
} else {
    show_debug_message("Invalid command: "+str);
}
