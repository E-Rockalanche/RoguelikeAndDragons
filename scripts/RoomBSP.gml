var root = argument0
var min_width = max(MIN_ROOM_WIDTH, argument1);
var min_height = max(MIN_ROOM_HEIGHT, argument2);
var target_max_width = min(RoomGetWidth(root), argument3);
var target_max_height = min(RoomGetHeight(root), argument4);
var seperation = argument5;

var room_list = ds_list_create();
var old_list = ds_list_create();
var new_list;

ds_list_add(room_list, root);
ds_list_add(old_list, root);

while(ds_list_size(old_list)) {
    new_list = ds_list_create();
    for(var n = 0; n < ds_list_size(old_list); n++) {
        var rm = old_list[| n];
        
        var can_split_hor = RoomGetWidth(rm) >= (min_width*2 + seperation);
        var can_split_ver = RoomGetHeight(rm) >= (min_height*2 + seperation);
        
        var split_hor;
        if (can_split_hor && can_split_ver) {
            split_hor = chance(50);
        } else if (!can_split_hor && !can_split_ver) {
            continue;
        } else {
            split_hor = can_split_hor;
        }
        
        if (split_hor) {
            if (RoomGetWidth(rm) > target_max_width) || chance(33) {
                var new_width = irandom_range(min_width, RoomGetWidth(rm) - min_width - seperation);
                var new_rm = RoomSplitHorizontally(rm, new_width, seperation);
                ds_list_add(new_list, new_rm, rm);
                ds_list_add(room_list, new_rm);
            } else if (RoomGetHeight > target_max_height) {
                ds_list_add(new_list, rm);
            }
        } else {
            if (RoomGetHeight(rm) > target_max_height) || chance(33) {
                var new_height = irandom_range(min_height, RoomGetHeight(rm) - min_height - seperation);
                var new_rm = RoomSplitVertically(rm, new_height, seperation);
                ds_list_add(new_list, new_rm, rm);
                ds_list_add(room_list, new_rm);
            } else if (RoomGetWidth > target_max_width) {
                ds_list_add(new_list, rm);
            }
        }
    }
    ds_list_destroy(old_list);
    old_list = new_list;
}
ds_list_destroy(old_list);
return room_list;
