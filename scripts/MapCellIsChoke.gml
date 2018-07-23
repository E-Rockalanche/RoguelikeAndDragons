with(argument0) {
    var i = argument1;
    var j = argument2;
    
    var sections = 0;
    var found_open = false;
    var started_on_open = false;
    for(var d = 0; d < 8; d++) {
        var ii = x_dirs_in_order[d];
        var jj = y_dirs_in_order[d];
        if ((tile_grid[# ii, jj] == Tile.FLOOR) && MapDiagFree(id, i, j, ii, jj)) {
            if (d == 0) {
                started_on_open = true;
            }
            if (!found_open) {
                found_open = true;
                sections++;
            }
        } else {
            found_open = false;
        }
    }
    if (found_open && started_on_open) {
        sections--;
    }
    return sections > 1
}
