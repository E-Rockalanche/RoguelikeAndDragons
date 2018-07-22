with(argument0) {
    was_in_view = in_view;
    in_view = argument1;
    visible = in_view;
    
    if (in_view) {
        discovered = true;
    }
}
