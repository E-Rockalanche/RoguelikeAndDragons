var grid = argument0;
var x0 = argument1;
var y0 = argument2;
var value = argument3;

var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

if (!withinBounds(x0, y0, 0, 0, width, height)) return 0;

var replace = grid[# x0, y0];
var queue = ds_queue_create();
ds_queue_enqueue(queue, Point(x0, y0, width));
grid[# x0, y0] = value;
var num_replaced = 1;

while(ds_queue_size(queue)) {
    var point = ds_queue_dequeue(queue);
    var i = PointGetX(point, width);
    var j = PointGetY(point, height);
    for(var d = 0; d < 4; d++) {
        var ii = i + dirs[d, 0];
        var jj = j + dirs[d, 1];
        if (withinBounds(ii, jj, 0, 0, width, height)) {
            if (grid[# ii, jj] == replace) {
                grid[# ii, jj] = value;
                num_replaced++;
                ds_queue_enqueue(queue, Point(ii, jj, width));
            }
        }
    }
}
ds_queue_destroy(queue);
return num_replaced;
