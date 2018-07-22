var new_map = instance_create(0, 0, obj_map);
with (new_map) {
    width = argument0;
    height = argument1;
    
    tile_grid = ds_grid_create(width, height);
    ds_grid_clear(tile_grid, Tile.WALL);
    flag_grid = ds_grid_create(width, height);
    g_grid = ds_grid_create(width, height);
    parent_grid = ds_grid_create(width, height);
    open_grid = ds_grid_create(width, height);
    closed_grid = ds_grid_create(width, height);
    movement_grid = ds_grid_create(width, height);
    view_grid = ds_grid_create(width, height);
};
return new_map;
