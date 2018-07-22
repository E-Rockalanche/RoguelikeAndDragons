var rm = argument[0];
var new_height = argument[1];
var sep = 1;
if (argument_count > 2) {
    sep = argument[2];
}
assert(rm[? "height"] >= new_height + MIN_ROOM_HEIGHT + sep, "Cannot split room vertically");

var new_rm = Room(rm[? "left"], rm[? "top"] + new_height + 1, rm[? "width"], rm[? "height"] - new_height - 1);
rm[? "height"] = new_height;
return new_rm;
