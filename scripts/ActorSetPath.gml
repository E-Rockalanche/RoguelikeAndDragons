with(argument0) {
    var new_path = argument1;
    if (path_stack != NULL) {
        ds_stack_destroy(path_stack);
    }
    path_stack = new_path;
}
