/*
executed by obj_map
*/

var view_list = argument0;
var mask = argument1;
var x0 = argument2;
var y0 = argument3;
var octant = argument4;
var max_radius = argument5;
var start_column = argument6;
var start_slope = argument7;
var end_slope = argument8;
var add_walls = argument9;
    
/*
    \2|1/
    3\|/0
    --@--
    4/|\7
    /5|6\
*/

// fail safe
if ((start_column > max_radius)
        || (end_slope <= start_slope && !SEE_THROUGH_CRACKS)
        || (end_slope < start_slope && SEE_THROUGH_CRACKS)) {
    exit;
}

for(var column = start_column; column <= max_radius; column++) {
    var start_row = max(0, ceil(start_slope*(column) - 0.5));
    var end_row = min(column, round(end_slope*(column)));
    
    // restrict vision to circle
    if ((column*column + start_row*start_row) > (max_radius*max_radius)) {
        exit;
    }
    if ((column*column + end_row*end_row) > (max_radius*max_radius)) {
        end_row = floor(sqrt(max_radius*max_radius - column*column));
    }
    
    
    // for each row of column in view
    for(var row = start_row; row <= end_row; row++) {
        var pos = getOctantPosition(x0, y0, column, row, octant);
        var i = pos[0];
        var j = pos[1];
        
        // stop if out of bounds. Should restrict column and row instead?
        if (!withinBounds(i, j, 0, 0, width, height))
            exit;
        
        var flags = flag_grid[# i, j];
        var tile = tile_grid[# i, j];
        obstructs_view = (flags & TileFlag.OBSTRUCTS_VIEW);
        
        if !mask[# i, j] {
            /*
            if (obstructs_view && add_walls) {
                // if next closest tile to center is in mask, add this wall to mask
                var pos2 = getOctantPosition(x0, y0, column-1, max(0, row-1), octant);
                if mask[# pos2[0], pos2[1]] {
                    mask[# i, j] = true;
                    ds_list_add(view_list, Point(i, j));
                }
            } else {
                // add to mask
                mask[# i, j] = true;
                ds_list_add(view_list, Point(i, j));
            }
            */
            mask[# i, j] = true;
            ds_list_add(view_list, Point(i, j));
        }
            
        if obstructs_view {
            // split scan into two
            // start new scan below wall, old scan continues above wall
            var new_start_slope = (row + 0.5)/(column - 0.5);
            var new_end_slope = (row - 0.5)/(column + 0.5);
            
            if (((new_end_slope > start_slope) && !SEE_THROUGH_CRACKS)
                    || (new_end_slope >= start_slope && SEE_THROUGH_CRACKS)) {
                //continue FOV below wall
                if (((end_slope > new_start_slope) && !SEE_THROUGH_CRACKS)
                        || ((end_slope >= new_start_slope) && SEE_THROUGH_CRACKS)) {
                    //continue FOV above wall
                    mapScanOctantFOV(view_list, mask, x0, y0, octant, max_radius, column + 1, start_slope, new_end_slope, add_walls);
                    start_slope = new_start_slope;
                } else {
                    end_slope = new_end_slope;
                    end_row = row;// min(ceil(end_slope*(column)), column);
                }
            } else if (((end_slope > new_start_slope) && !SEE_THROUGH_CRACKS)
                    || ((end_slope >= new_start_slope) && SEE_THROUGH_CRACKS)) {
                //continue FOV below wall
                start_slope = new_start_slope;
            } else {
                exit;
            }
        }
    }
    // ended column
    // stop if no area to scan
    if (((start_slope >= end_slope) && !SEE_THROUGH_CRACKS)
            || ((start_slope > end_slope) && SEE_THROUGH_CRACKS)) {
        exit;
    }
}
