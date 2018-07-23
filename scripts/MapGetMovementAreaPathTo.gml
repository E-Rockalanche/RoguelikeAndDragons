with(argument0) {
    var dest_i = argument1;
    var dest_j = argument2;
    if (withinBounds(dest_i, dest_j, 0, 0, width, height)) {
        if (movement_grid[# dest_i, dest_j]) {
            return MapGetEmptyEndPathTo(argument0, dest_i, dest_j);
        }
    }
    return NULL;
}
