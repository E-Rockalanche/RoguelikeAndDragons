var x0 = argument0;
var y0 = argument1;
var x1 = argument2;
var y1 = argument3;
    
var found = mapAstarFindHallway(x0, y0, x1, y1);
assert(found, "Cannot find path between rooms");

var i = x1;
var j = y1;
while(parent_grid[# i, j] != NULL) {
    tile_grid[# i, j] = Tile.FLOOR;
    var parent_point = parent_grid[# i, j];
    i = PointGetX(parent_point);
    j = PointGetY(parent_point);
}
