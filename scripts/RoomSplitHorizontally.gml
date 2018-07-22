var rm = argument[0];
var new_width = argument[1];
var sep = 1;
if (argument_count > 2) {
    sep = argument[2];
}
assert(rm[? "width"] >= new_width + MIN_ROOM_WIDTH + sep, "Cannot split room horizontally");

var new_rm = Room(rm[? "left"] + new_width + 1, rm[? "top"], rm[? "width"] - new_width - 1, rm[? "height"]);
rm[? "width"] = new_width;
return new_rm;
