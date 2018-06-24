var scale = argument0;
var center_x = view_xview + view_wview/2;
var center_y = view_yview + view_hview/2;
view_wview *= scale;
view_hview *= scale;
view_xview = center_x - view_wview/2;
view_yview = center_y - view_hview/2;
